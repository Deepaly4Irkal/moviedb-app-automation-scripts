import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:moviedb/core/presentation/widgets/custom_search_bar.dart';
import 'package:moviedb/core/presentation/widgets/movie_list_tile.dart';
import 'package:moviedb/features/movies/presentation/blocs/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:moviedb/injection_container.dart';
import 'package:moviedb/main.dart' as app;

import '../test/features/movies/presentation/blocs/popular_movies_bloc copy/popular_movies_bloc_test.mocks.dart';

void main() {

  group('end-to-end test', () {

    testWidgets('test to see movie details',
            (tester) async {
          app.main();
          await tester.pumpAndSettle(const Duration(seconds: 8));
          expect(find.text('Movie DB App'), findsOneWidget);
          await  tester.tap(find.byType(MovieListTile).first);
          await tester.pumpAndSettle();
          expect(find.text('Overviews:'), findsOneWidget);


        });


  });
}