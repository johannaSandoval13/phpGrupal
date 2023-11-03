<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Occupation extends Model
{
    use HasFactory;

    protected $table="occupations";

    protected $fillable=[
        "occupation_code",
        "occupation_name",
        "occupation_description"];
}
