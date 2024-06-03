import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/core/presentation/widgets/movie_list_tile.dart';
import 'package:moviedb/main.dart' as app;

import '../test/features/movies/presentation/blocs/popular_movies_bloc copy/popular_movies_bloc_test.mocks.dart';

void main() {

  group('end-to-end test', () {

    testWidgets('test to get list of movies or series by sorting based on popularity',
            (tester) async {
          app.main();


          await tester.pumpAndSettle();
          expect(find.text('Movie DB App'), findsOneWidget);
          await  tester.tap(find.text('Popular'));
          await tester.pumpAndSettle();
          expect(find.text('The Shawshank Redemption'), findsOneWidget);
          //var movieList = find.byType(MovieListTile).allCandidates;
          for(var movie =0 ; movie < 5; movie++){
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