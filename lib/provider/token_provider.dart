import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/box_manager.dart';

@immutable
class TokenState {
  final String? privateToken;

  const TokenState({this.privateToken});

  copyWith({String? privateToken}) {
    return TokenState(
      privateToken: privateToken ?? this.privateToken,
    );
  }
}

class TokenProvider extends StateNotifier<TokenState> {
  TokenProvider({
    required this.privateToken,
  }) : super(TokenState(privateToken: privateToken));

  String? privateToken;

  setPrivateToken(String? value) {
    Future.delayed(Duration.zero, () {
      state = state.copyWith(privateToken: value);
      BoxManager().setPrivateToken(value);
    });
  }
}

final tokenProvider = StateNotifierProvider<TokenProvider, TokenState>((ref) {
  String? privateToken = BoxManager().getPrivateToken();
  return TokenProvider(privateToken: privateToken);
});
