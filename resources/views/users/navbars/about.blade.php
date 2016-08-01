
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 " align="center"> <img src="{{ $user->slika }}" onerror="this.src='http://www.scoopstake.com/assets/images/campaigns/no-photo.gif'" class="img-circle" style="width: 200px; height: 200px;"> </div>
                                <div class=" col-md-9 col-sm-9 ">
                                    <table class="table table-user-information">
                                        <tbody>
                                        <tr>
                                            <td>Naziv</td>
                                            <td>{{ $user->naziv }}</td>
                                        </tr>
                                        <tr>
                                            <td>Elektronski naslov</td>
                                            <td><a href="mailto:{{ $user->email }}">{{ $user->email }}</a></td>
                                        </tr>
                                        <tr>
                                            <td>Izobrazba</td>
                                            <td>{{ $user->izobrazba or "uporabnik ni posredoval podatkov o svoji izobrazbi."}}</td>
                                        </tr>
                                        <tr>
                                            <td>Datum rojstva</td>
                                            <td>{{ $user->rojstvo or "uporabnik ni posredoval datuma rojstva."}}</td>
                                        </tr>

                                        <tr>
                                        <tr>
                                            <td>Telefon</td>
                                            <td>{{ $user->telefon or "uporabnik ni posredoval telefonske številke."}}</td>
                                        </tr>
                                        <tr>
                                            <td>Opis</td>
                                            <td>{{ $user->opis or "uporabnikov opis je prazen."}}</td>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                         <div class="panel-footer">
                            <a href="{{ url('users/'.$user->userid.'/edit') }}" class="btn btn-primary">Obišči profil na forumu</a>
                            @if($user->userid == Auth::user()->userid)
                                 <span class="pull-right">
                                    <a href="{{ url('users/'.$user->userid.'/edit') }}" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                                 </span>
                             @endif
                        </div>