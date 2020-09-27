import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repo/biz/user_biz.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/pages/home_page.dart';
import 'package:github_repo/provide/user_provide.dart';
import 'package:github_repo/utils/sp_util.dart';
import 'package:github_repo/utils/util.dart';
import 'package:github_repo/widgets/login_wave_clippers.dart';
import 'package:provide/provide.dart';

class LoginPage extends StatefulWidget {
  static const ROUTE_NAME = '/login';

  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _loginFormKey = new GlobalKey();
  FocusNode _passwordFocusNode, _loginFocusNode;
  bool _isShowPassword = false;
  String _username = '';
  String _password = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _loginFocusNode = FocusNode();
  }

  void _showPassword() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  void _doLogin() {
    _loginFormKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    SPUtils.logout();
    UserBiz.login(_username, _password).then((userEntity) async {
      if (userEntity != null) {
        Provide.value<UserProvide>(context).updateUser(userEntity);
        Navigator.of(context).pushReplacementNamed(HomePage.ROUTE_NAME);
      } else {
        throw Exception('Error when retrieving user information!');
      }
    }).catchError((e) {
      Util.showToast('Login failed : ${e.toString()}');
    }).whenComplete(() {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Widget _buildLoginLoading() {
    return CircularProgressIndicator();
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          focusNode: _loginFocusNode,
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              Language.current.login,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          onPressed: () {
            if (_loginFormKey.currentState.validate()) {
              _doLogin();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Theme.of(context).primaryColorDark.withOpacity(0.3),
                        Theme.of(context).primaryColorLight.withOpacity(0.3)
                      ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Theme.of(context).primaryColorDark.withOpacity(0.6),
                        Theme.of(context).primaryColorLight.withOpacity(0.6)
                      ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Icon(
                        Icons.developer_mode,
                        color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "GITHUB",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Theme.of(context).primaryColorDark,
                        Theme.of(context).primaryColorLight
                      ])),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            key: _loginFormKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextFormField(
                      autofocus: true,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      validator: (value) {
                        return value.isEmpty
                            ? Language.current.thisFieldCannotBeEmpty
                            : null;
                      },
                      onSaved: (value) {
                        this._username = value;
                      },
                      decoration: InputDecoration(
                          hintText: Language.current.loginAccountHint,
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.account_circle,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextFormField(
                      focusNode: _passwordFocusNode,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_loginFocusNode),
                      validator: (value) {
                        return value.isEmpty
                            ? Language.current.thisFieldCannotBeEmpty
                            : null;
                      },
                      onSaved: (value) {
                        this._password = value;
                      },
                      obscureText: !_isShowPassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isShowPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () => _showPassword()),
                          hintText: Language.current.loginPasswordHint,
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.lock,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                child: child,
                scale: animation,
              );
            },
            child: _isLoading ? _buildLoginLoading() : _buildLoginButton(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _loginFocusNode.dispose();
    super.dispose();
  }
}
