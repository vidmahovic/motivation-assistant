<?php  
namespace App\Services;

use DB;


class HierarchyService {


    protected $root_id;


    public function __construct($root_id) {

        $this->root_id = $root_id;
    }



    public function build() {


        // dobimo podatke o korenskem clenu
        $sql_clen = DB::table("clen_hierarhije")->where("id_clena_hierarhije", $this->root_id)->first();

        $cleni_hierarhije = array("name" => $sql_clen->ime_clena_hierarhije);
        $dokument = $this->addChildren($this->root_id);
        $cleni_hierarhije["children"] = $dokument;

        return json_encode($cleni_hierarhije);

    }


    private function addChildren($id) {

        $seznam = [];

        $sql_nadrejeni = DB::table("clen_hierarhije")->where("id_nadrejenega_clena_hierarhije", $id)->get();

        if($sql_nadrejeni != null){
            foreach($sql_nadrejeni as $nadrejeni){
                // clen je oblike: "name" => ime in "children" => array(otroci), array(otroci) pa je clen
                $clen = array("name" => $nadrejeni->ime_clena_hierarhije);
                $podrejeni = $this->addChildren($nadrejeni->id_clena_hierarhije);

                if($podrejeni != null){
                    $clen["children"] = $podrejeni;
                }

                array_push($seznam, $clen);
            }
        } else {
            $sql_user = DB::table("spada_v")->join("oseba", "spada_v.userid", "=", "oseba.userid")->where("id_clena_hierarhije", $id)->get();

            foreach($sql_user as $user){
                $meta = array("name" => $user->ime." ".$user->priimek);
                array_push($seznam, $meta);
            }

            return $seznam;
        }

        return $seznam;

    }
}