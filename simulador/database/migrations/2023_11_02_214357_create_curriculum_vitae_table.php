<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('curriculum_vitae', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignId('student_id')->constrained('student')->onDelete('cascade');
            $table->string('Address');
            $table->string('Social status');
            $table->string('Elemental School');
            $table->string('elemental_school_diploma');
            $table->string('High School');
            $table->string('high_school_diploma');
            $table->string('University')->nullable(true);
            $table->string('university_diploma')->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('curriculum_vitae');
    }
};
