import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;

Future<UserCredential> doLogin() async {
  var api = new simpleAuth.GoogleApi(
    "google",
    "613126001006-i0dm817nchseml1l6nhqc9kc994nr5fc.apps.googleusercontent.com",
    "",
    clientSecret: "eqgqaaFpLyjf0QJPnZ6Ty_Fs",
    scopes: [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/userinfo.profile"
    ],
  );
  await api.authenticate();
  var currentOauthAccount = api.currentOauthAccount;
  // var request = new simpleAuth.Request(
  //   simpleAuth.HttpMethod.Get,
  //   "https://www.googleapis.com/oauth2/v1/userinfo?alt=json",
  // );
  // var userInfo = await api.send<UserInfo>(request);

  // Create a new credential
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: currentOauthAccount.token,
    idToken: currentOauthAccount.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

void logout() async {
  return await FirebaseAuth.instance.signOut();
}
