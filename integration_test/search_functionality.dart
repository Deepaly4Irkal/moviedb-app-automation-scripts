import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:how_to/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:moviedb/core/presentation/widgets/custom_search_bar.dart';
import 'package:moviedb/core/presentation/widgets/movie_list_tile.dart';
import 'package:moviedb/features/movies/presentation/blocs/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:moviedb/injection_container.dart';
import 'package:moviedb/main.dart';
import 'package:moviedb/main.dart' as app;

import '../test/features/movies/presentation/blocs/popular_movies_bloc copy/popular_movies_bloc_test.mocks.dart';

void main() {

  group('end-to-end test', () {


    testWidgets('test to search by name',
            (tester) async {
          app.main();


          await tester.pumpAndSettle(const Duration(seconds: 4));
          expect(find.text('Movie DB App'), findsOneWidget);
          // await  tester.tap(find.byKey(const ValueKey("search_bar_movie")));
          await tester.pumpAndSettle();
          //expect(find.text('The Shawshank Redemption'), findsOneWidget);
          await tester.enterText(find.byKey(const ValueKey("search_bar_movie")), 'The Shawshank Redemption');
          await tester.pumpAndSettle(const Duration(seconds: 2));

          //var movieList = find.byType(MovieListTile).allCandidates;

          for(var movie =0 ; movie < 1; movie++){
            var list = find
                .descendant(
              of: find.byType(MovieListTile).at(movie),
              matching: find.byType(Text),
            )
                .evaluate().toList()[1];
            debugPrint(list.toString());
          }

        });


  });
}