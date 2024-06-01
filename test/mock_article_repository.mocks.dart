// Mocks generated by Mockito 5.4.4 from annotations
// in simple_app/test/mock_article_repository.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:simple_app/data/models/top_stories.dart' as _i2;

import 'domain/mock _repository/article_repository.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeArts_0 extends _i1.SmartFake implements _i2.TopStories {
  _FakeArts_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ArticlesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockArticlesRepository extends _i1.Mock
    implements _i3.ArticlesRepository {
  MockArticlesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.TopStories> fetchArticles() => (super.noSuchMethod(
        Invocation.method(
          #fetchArticles,
          [],
        ),
        returnValue: _i4.Future<_i2.TopStories>.value(_FakeArts_0(
          this,
          Invocation.method(
            #fetchArticles,
            [],
          ),
        )),
      ) as _i4.Future<_i2.TopStories>);

  @override
  _i4.Future<_i2.TopStories> searchArticles(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchArticles,
          [query],
        ),
        returnValue: _i4.Future<_i2.TopStories>.value(_FakeArts_0(
          this,
          Invocation.method(
            #searchArticles,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.TopStories>);

  @override
  _i4.Future<_i2.TopStories> filterArticles(String? section) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterArticles,
          [section],
        ),
        returnValue: _i4.Future<_i2.TopStories>.value(_FakeArts_0(
          this,
          Invocation.method(
            #filterArticles,
            [section],
          ),
        )),
      ) as _i4.Future<_i2.TopStories>);
}
