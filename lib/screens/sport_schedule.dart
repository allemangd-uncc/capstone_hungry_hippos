import 'package:flutter/material.dart';

class sport_schedule {
  final int id;               //id for each game
  final DateTime date;        //date: 2020-09-05T00:00:00
  final String location_indicator; //location_indicator: H-Home / A-Away
  final String location;      //location: Knoxville, Tenn., Charlotte, NC

  // -- sport json --
  final int idSport;          //id: Each sport different number
  final String sportTitle;    //title: Football, Men's Soccer
  final String gender;        //gender: M - F

  // -- opponent json --
  final String opponentTitle; //title: Tennessee, Norfolk State
  final String image;

  // -- result json --
  final String status;        //status: W - T - L
  final String team_score;       //team_score:
  final String opponent_score;   //opponent_score:
  final String postscore;

  sport_schedule(
      this.id, {
        this.date,
        this.location_indicator,
        this.location,

        this.idSport,
        this.sportTitle,
        this.gender,

        this.opponentTitle,
        this.image,

        this.status,
        this.team_score,
        this.opponent_score,
        this.postscore,
      });

  factory sport_schedule.fromJson(Map<String, dynamic> json) {
    return sport_schedule(
      json['id'],
      date: DateTime.parse(json['date']),
      location_indicator: json['location_indicator'],
      location: json['location'],

      idSport: json['sport']['id'],
      sportTitle: json['sport']['title'],
      gender: json['sport']['gender'],

      opponentTitle: json['opponent']['title'],
      image: json['opponent']['image'],

      status: json['result']['status'],

      team_score: json['result']['team_score'],
      opponent_score: json['result']['opponent_score'],
      postscore: json['result']['postscore'],
    );
  }
}
