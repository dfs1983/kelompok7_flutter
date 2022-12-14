import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galerimusik_klpk7/blocs/search_song_bloc.dart';
import 'package:galerimusik_klpk7/models/song_search_result.dart';
import 'package:galerimusik_klpk7/screens/song_data_loader_scrn.dart';
import 'package:galerimusik_klpk7/screens/search_scrn/song_list_item_widget.dart';
import 'package:galerimusik_klpk7/widgets/loading_widget.dart';
import 'package:galerimusik_klpk7/widgets/network_error_widget.dart';
import 'package:lottie/lottie.dart';
import 'songs_search_delegate.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String lastSearchedSong = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar() as PreferredSizeWidget?,
      body: BlocBuilder<SearchSongBloc, SearchSongBlocState>(
        builder: (context, state) {
          late Widget screenWidget;
          if (state is InitialState) {
            screenWidget = _buildInitialWidget();
          } else if (state is LoadingState) {
            screenWidget = _buildLoadingWidget();
          } else if (state is ErrorState) {
            screenWidget = _buildErrorWidget();
          } else if (state is LoadedState) {
            var songsDetails = state.songSearchResult.songsDetails;
            if (songsDetails.isEmpty) {
              screenWidget = _buildNoSongsFoundWidget();
            } else {
              screenWidget = _buildSongsWidgetsList(songsDetails);
            }
          }

          return WillPopScope(
            onWillPop: onUserHitBack,
            child: screenWidget,
          );
        },
      ),
    );
  }

  Future<bool> onUserHitBack() async {
    // If user hit back button and has result,clear the result
    // else , pop the screen
    SearchSongBlocState state = context.read<SearchSongBloc>().state;
    if (state is LoadedState) {
      context.read<SearchSongBloc>().add(ClearSearch());
      return false;
    } else {
      return true;
    }
  }

  void onSearchSubmitted(String? query) {
    if (query != null) {
      setState(() {
        lastSearchedSong = query;
      });
      context.read<SearchSongBloc>().add(SearchForSong(query));
    }
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        "Galeri Musik" +
            (lastSearchedSong.trim().isEmpty
                ? ""
                : ": " + lastSearchedSong.trim()),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: openSearchDelegate,
        ),
      ],
    );
  }

  void openSearchDelegate() async {
    var searchedSong = await showSearch(
      context: context,
      delegate: SongsSearchDelegate(),
      query: lastSearchedSong,
    );
    onSearchSubmitted(searchedSong);
  }

  Widget _buildLoadingWidget() {
    return LoadingWidget();
  }

  Widget _buildInitialWidget() {
    // If user touch anywhere in the screen
    // push the screen dialogue
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: openSearchDelegate,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Lottie.asset(
                  "assets/lottie_animations/4876-speakers-music.json",
                  repeat: true,
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Text(
                  "Ketuk dimana saja untuk mencari Lirik Lagu",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSongClicked(SongDetails songDetails) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SongDataLoaderScreen(songDetails)),
    );
  }

  Widget _buildSongsWidgetsList(List<SongDetails> songsDetails) {
    List<Widget> list = [];
    songsDetails.forEach((e) {
      Widget songWidget = InkWell(
        onTap: () {
          onSongClicked(e);
        },
        child: SongListItemWidget(e),
      );
      list.add(songWidget);
    });
    return ListView(
      children: list,
    );
  }

  Widget _buildNoSongsFoundWidget() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie_animations/empty.json",
                height: MediaQuery.of(context).size.height / 3, repeat: false),
            Opacity(
              opacity: 0.8,
              child: Text(
                "No Songs Found :(",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    void onRetryClicked() {
      if (lastSearchedSong.isNotEmpty) {
        context.read<SearchSongBloc>().add(SearchForSong(lastSearchedSong));
      }
    }

    return NetworkErrorWidget(
      onRetryClicked: onRetryClicked,
    );
  }
}
