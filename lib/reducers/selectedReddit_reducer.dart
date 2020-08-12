import 'package:async_app/actions/index.dart';
import 'package:redux/redux.dart';

final selectRedditReducer = combineReducers<String>([
  TypedReducer<String, SelectReddit>(_selectReddit),
]);

String _selectReddit(String state, SelectReddit action) {
  return action.reddit;
}
