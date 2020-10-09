<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class UserAccess extends Model
{
    use HasFactory;
    // Le cambio porque tengo creado user en luager de users
    protected $table = 'user_access';


    /**
     * Creo un subquery que muestra solamente los ultimos registros de cada usuario
     */
    public static function getLastEntrySbuQuery(){
        $last_entry = static::select('user_access.user_id',DB::raw(' MAX(access_at)  as last_access') )
            ->groupBy("user_access.user_id");
        return static::select(DB::raw('user_access.*'))->joinSub($last_entry,"lastest_access",function($join){
            $join->on('user_access.user_id','=','lastest_access.user_id');
            $join->on('user_access.access_at','=','lastest_access.last_access');
        });
    }


}
