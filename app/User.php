<?php

namespace App;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;
use Illuminate\Database\Eloquent\SoftDeletes as SoftDeletes;
use Carbon\Carbon;
use Hash;
use Auth;


class User extends Model implements AuthenticatableContract, CanResetPasswordContract
{
    use Authenticatable, CanResetPassword, SoftDeletes;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'oseba';

    protected $primaryKey = 'userid';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['ime', 'priimek', 'email', 'password', 'naziv', 'izobrazba', 'rojstvo', 'telefon', 'opis'];

    protected $guarded = ['userid'];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = ['password', 'remember_token'];

    protected $dates = ['rojstvo', 'deleted_at'];

    public static function boot() {

        parent::boot();

        static::creating(function($model) {

            $last_id = self::orderBy('userid', 'desc')->pluck('userid');
            $model->userid = intval($last_id)+1;
            return true;
        });

    }

    

    public function posts() {
        return $this->hasMAny('\App\Post', 'userid', 'userid');
    }

    public function tasks() {
        return $this->hasMany('\App\Task', 'userid', 'userid');
    }

    public function points() {
        return $this->hasOne('App\Score', 'userid', 'userid');
    }

    public function shouts() {
        return $this->hasMany('\App\Shout', 'userid', 'userid');
    }

    public function logsPassive() {
        return $this->hasMany('\App\Log', 'userid_pasiven', 'userid');
    }
    public function logsActive() {
        return $this->hasMany('\App\Log', 'userid_aktiven', 'userid');   
    }

    /**
     * connects with model Hierarchy, which has a slave_id : master_id pair 
     * to build a hierarchy tree
     * 
     * @return Eloquent object
     */
    public function hierarchy() {
        return $this->belongsToMany('\App\Hierarchy', 'hierarchies_users')->withPivot('user_id');
    }

    //MUTATORS
    /**
     * hashes the password before inserting into DB
     * 
     * @param mixed $value
     */
    public function setPasswordAttribute($value) {

        $this->attributes['password'] = Hash::make($value);
    }

    public function setRojstvoAttribute($date) {
        $this->attributes['rojstvo'] = Carbon::parse($date);
    }

    public function setImeAttribute($name) {
        $this->attributes['ime'] = strtolower($name);
    }

    // MUTATORS
    public function getImeAttribute() {
        return ucfirst($this->attributes['ime']);
    }

    public function getPriimekAttribute() {
        return ucfirst($this->attributes['priimek']);   
    }



    public function scopeSeek($query, $id) {
        return $query->findOrFail($id);
    }

    public function scopeActive() {
        //return $query->where()
    }

    public function scopeQaposts($query) {

    }

    /**
     * return a paginated collection of users, except for the logged in user
     * @param  Elquent $query 
     * @param  int $num   number of users per page
     * @return Collection        returns paginated collection
     */
    public function scopePagination($query, $num) 
    {
       return $query->orderBy('userid', 'desc')
                    ->where('userid', '!=', Auth::user()->userid)
                    ->paginate($num);
    }

}
