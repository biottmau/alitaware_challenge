<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;
    // Le cambio porque tengo creado user en luager de users
    protected $table = 'user';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /** 
     * Busco los usuarios por login, email o nombre del suscriber
     */
    public static function search($val)
    {
        $model = static::leftJoinSub(UserAccess::getLastEntrySbuQuery(), 'last_entries', function ($join) {
            $join->on('user.id', '=', 'last_entries.user_id');
        })
            ->leftJoin('suscriber_account', 'user.id', '=', 'suscriber_account.user_id')
            ->where('user.username', 'like', '%' . $val . '%')
            ->orWhere('user.email', 'like', '%' . $val . '%')
            ->orWhere('suscriber_account.name', 'like', '%' . $val . '%');
        return $model->get();
    }
}
