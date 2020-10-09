<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Payments extends Model
{
    use HasFactory;
    // Le cambio la tabla
    protected $table = 'payments';

    public static function getAllForDataTable()
    {
        $model = static::select("payments.*", "user.username", "user.email")
            ->join('user', "payments.user_id", "=", "user.id")->get();
        $aRet = [];
        foreach ($model as $p) {
            $aRow = $p;
            // Busco las suscripciones pagadas con el pago
            $model_detail = DB::table('payments_suscriptions')
                ->join("suscriptions", "payments_suscriptions.suscriptions_id", "=", "suscriptions.id")
                ->where("payments_id", "=", $p['id'])->get()->toArray();
            $aRow['suscriptions'] = $model_detail;
            // Busco equipo si existe
            $model_team = DB::table('payments_team')
                ->join("teams", "payments_team.teams_id", "=", "teams.id")
                ->where("payments_id", "=", $p['id'])->get()->toArray();
            $aTeams = [];
            foreach($model_team as $t){
                $aTmp = (array)$t;
                // agregos los usuarios del equipo
                $model_user_team = DB::table("teams_users")
                    ->join('user', 'user.id', '=', 'teams_users.user_id')
                    ->where("teams_users.teams_id", '=', $aTmp['teams_id'])->get()->toArray();
                $aTmp["users"] = $model_user_team;
                $aTeams[] = $aTmp;
            }
            $aRow['team'] = $aTeams;
            $aRet[] = $aRow;
        }
        return $aRet;
    }
}
