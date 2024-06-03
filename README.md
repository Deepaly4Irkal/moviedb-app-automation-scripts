Test Plan for Movies and TV Shows Application
Overview 
To create scripts to test widgets in dart language.
This test plan outlines the strategy and approach for testing the Movies and TV Shows application. 
The primary features to be tested include retrieving a list of movies or series sorted by popularity and rating,
accessing series or movie details, and searching for movies or series by name. 
The plan also includes an automation test plan with acceptance criteria.

This sample project has Unit Testing scripts,therefore I choose to perform Integration Testing which is considered Gray-box testing.
One advantage of using Integration tests for automation is that the test code is located in the same repository as the development code. 
This allows for better control over updating locators with unique identifiers, analyzing common components, 
and using constants defined by the development team. This greatly improves the testability of the application.
It also helps to reduce flakiness in automation and minimize communication gaps between development and quality assurance (QA) teams,
as both teams are working with the same code and are aware of any changes to the functionality of the app.

In this Flutter project, unit and widget tests is located in the “test” folder, 
created integration tests which is located in the “integration_test” folder, as per the official Flutter documentation.
package:flutter_test/flutter_test.dart and package:flutter/material.dart
To perform Gray-box testing. Gray-box testing is a testing methodology that combines elements of both black-box testing and white-box testing. 
It involves testing an application with limited knowledge of its internal workings, 
often focusing on both the input/output and the internal structures of the software.

Objectives
-Ensure the functionality and reliability of the application features.
-Verify that the application meets the specified requirements.
-Identify and resolve defects before the application is released.

Automation Test Plan
Framework of Choice: Flutter for mobile application (Dart)
Justification: Flutter allows for seamless cross-platform mobile app development, 
and the community support and libraries available for Flutter testing make it an ideal choice.
Flutter App has limitation to Automate with other tools like Appium.
Integration testing within the Flutter Project is successful.
A directory integration_test has been created with various test scripts in .dart

Project structure: Created a new directory called integration_test and then created Dart File with various test cases content
moviedb-app/
├── lib/
├── test/
├── integration_test/
│   └── movie_detailed_screen.dart
│   └── movie_list_sorted_display_rating.dart
│   └── movie_list_sorted_popularity.dart
│   └── search_functionality.dart
└── pubspec.yaml

Tools and Libraries
Flutter Test: For writing and running unit tests.
Integration Test: For testing the entire application as a whole.

Setup: added the necessary packages to your pubspec.yaml file
dev_dependencies:
integration_test:
sdk: flutter
flutter_test:

Scope
In-scope:
- To write test scripts by finding elements by using
  Debug service listening on ws://127.0.0.1:55399/FjY-bY9wXC4=/ws while moviedb-app is build is running.
- In the Flutter Inspector: Select the elements of the widget tree and the corresponding element of the layout explorer to find the expected selected element.
- Another method of finding elements Open the link to connect to the Isar Inspector while this build is running https://inspect.isar.dev/3.1.0/#/55399/FjY-bY9wXC4
- Usage of find.text and find.byType 
- Scripts executed in Emulators and physical device.
- Scripts to Pass the test run.
- Implicit wait eg:await tester.pumpAndSettle() to wait for the new screen to display
- Assertion eg:expect(find.text('Overviews:'), findsOneWidget)
- Follow the scripting instructions based on https://docs.flutter.dev/testing/integration-tests
- Gray-box testing

Out-of-Scope:
- Different types of find elements like byvalue, byLabel, scrollable, byAction etc.
- Different types of asserts like findsAny, findsNWidgets, findsExactly, throwsFlutterError etc
- To verify display of popular movie list display data based on json values test>fixtures>movies_popular.json
  verify(mockMovieRepository.getPopularMovies());
- To verify display of searched movie list display data based on json values test>fixtures>search.json
  verify: (bloc) { expect(bloc.page, equals(tPage));
- To verify display of movie details display data based on json values test>fixtures>movie_details.json.
  verify(mockMovieRepository.getMovieDetails(movieId: tMovieId));
- Integration of the integration_test into Jenkins to be part of the CI/CD
- Before script, after script execution 
- Page Object Model (POM): Separate the UI from the test scripts
- Device level navigation, Gestures etc
- Modularity: reusable components and modules.
- Test Data Management: Store test data separately from the tests
- Cross-Device Testing
- Detailed logging mechanisms
- Performance Testing
- nomenclatures for Use case definition (Gherkin)
- Handling Flaky
- Metrics and Reporting
- Manual testing to find bugs 

Features to be Tested
-List of Movies or Series Sorted by Popularity and Rating
-Access Series or Movie Details
-Search Movies or Series by Name

Acceptance Criteria
    1. List of Movies or Series Sorted by Popularity and Rating
   Acceptance Criteria:
    - User can view a list of movies or series sorted by popularity.
    - User can view a list of movies or series sorted by rating.
    Test Cases:
    a. Verify that the default sorting option is by rating.
    b. Verify that the user can switch between sorting by popularity and rating.
    c. Verify that the list updates correctly when the sorting option is changed.

   2. Access Series or Movie Details
   Acceptance Criteria:
   - User can access details of a selected movie or series.
   - Details include title, description, cast, release date, rating, and genre.
   - The details page is displayed correctly and without errors.
   Test Cases:
    a.Verify that clicking on a movie or series title navigates to the details page.
    b.Verify that all details (title, description, cast, release date, rating, genre) are displayed correctly.
    c.Verify that the details page loads within an acceptable time frame (e.g., 4 seconds).

     3. Search Movies or Series by Name
     Acceptance Criteria:
      - User can search for movies or series by entering a name.
      - Search results are displayed in real-time as the user types. 
      - The search results include relevant movies or series matching the entered name.
    Test Cases:
      a.Verify that the search bar is accessible from the main page.
      b.Verify that typing in the search bar displays real-time results.
      c.Verify that the search results are relevant to the entered name.
      d.Verify that the search functionality handles partial matches and different cases (upper/lower).


Scenario: Display list of movies/series sorted by rating
Given the user is on the homepage
When the user requests a list of movies or series
Then the system should display the list sorted by rating

Test Scripts
Test Case: Get List of Movies/Series Sorted by Rating
Feature: Get List of Movies/Series


    testWidgets('test to get list of movies or series by sorting based on top rating',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();
            # Given the user is on the homepage
          expect(find.text('Movie DB App'), findsOneWidget);
          expect(find.text('Find your movies'), findsOneWidget);
          expect(find.text('Categories'), findsOneWidget);
          expect(find.text('Kingdom of the Planet of the Apes'), findsOneWidget);
        
        for(var movie =0 ; movie < 5; movie++){
        var list = find
        .descendant(of: find.byType(MovieListTile).at(movie),
        matching: find.byType(Text),
        )
        .evaluate().toList()[1];
        debugPrint(list.toString());
        }

Scenario: Display details of selected movie/series
Given the user is on the list of movies or series
When the user selects a specific movie or series
Then the system should display the details of the selected movie or series

 To get a list of movies or series sorted by popularity.
  1. Launch the App and verify the title of the App as Movie DB App
  2. Select the Popular button
  3. Verify the display of the 5 movies from the list of the screen
     Feature: Access Movie/Series Details

  testWidgets('test to get list of movies or series by sorting based on popularity',
  (tester) async {
            app.main();

          await tester.pumpAndSettle();
          expect(find.text('Movie DB App'), findsOneWidget);
          await  tester.tap(find.text('Popular'));
          await tester.pumpAndSettle();
          expect(find.text('The Shawshank Redemption'), findsOneWidget);
          for(var movie =0 ; movie < 5; movie++){
            var list = find
                .descendant(
              of: find.byType(MovieListTile).at(movie),
              matching: find.byType(Text),
            )
                .evaluate().toList()[1];
            debugPrint(list.toString());
          }

Feature: Search Movies/Series
Scenario: Display search results for movies/series
Given the user is on the homepage
When the user searches for a movie or series by name
Then the system should display the search results relevant to the entered name

 To search movies or series by name.
    1. Launch the App and verify the title of the App as Movie DB App
    2. Select the search button
    3. Type 'The Shawshank Redemption' in the textfield
    Note:In order for Search Textfield to work const ValueKey("search_bar_movie") had to be added to the code base. 
    in class CustomSearchBar a key with value had to be added "key: const ValueKey("search_bar_movie"),"

          Widget build(BuildContext context) {
          final textField = TextFormField(
          key: const ValueKey("search_bar_movie"),

 Verify the display of the movie title list from the screen. 

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

 To access series or movie details.
    1. Launch the App and verify the title of the App as Movie DB App
    2. Select the Popular button
    3. Select the first Movie
    3. Verify the display of the text "Overviews:" in movie details screen


    testWidgets('test to see movie details',
            (tester) async {
          app.main();
          await tester.pumpAndSettle(const Duration(seconds: 8));
          expect(find.text('Movie DB App'), findsOneWidget);
          await  tester.tap(find.byType(MovieListTile).first);
          await tester.pumpAndSettle();
          expect(find.text('Overviews:'), findsOneWidget);
        });
