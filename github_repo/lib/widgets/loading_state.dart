import 'package:flutter/material.dart';
import 'package:github_repo/generated/i18n.dart';

enum StateFlag { empty, loading, error, complete, idle }

class LoadingState extends StatelessWidget {
  final StateFlag flag;
  final String message;
  final Function onRetry;

  const LoadingState(this.flag, {Key key, this.message, this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _tipMsg;
    if (flag == StateFlag.empty || flag == StateFlag.error) {
      if (this.message != null) {
        _tipMsg = message;
      } else {
        if (flag == StateFlag.empty) {
          _tipMsg = Language.current.empty;
        } else if (flag == StateFlag.error) {
          _tipMsg = Language.current.oopsWrong;
        }
      }

      return Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(_tipMsg, style: TextStyle(color: Theme
                  .of(context)
                  .primaryColor),),
              FlatButton(
                child: Text(Language.current.tapToRetry,
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.w600),),
                onPressed: () {
                  onRetry();
                },
              )
            ],
          ),
        ),
      );
    } else {
      return Offstage(
        offstage: true,
        child: Container(),
      );
    }
  }
}
