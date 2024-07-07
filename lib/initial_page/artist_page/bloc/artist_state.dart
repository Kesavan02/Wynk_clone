part of 'artist_bloc.dart';

abstract class ArtistState {}

abstract class ArtistActionState extends ArtistState {}

class ArtistInitialState extends ArtistState {}

class ArtistSuccessState extends ArtistState {}
