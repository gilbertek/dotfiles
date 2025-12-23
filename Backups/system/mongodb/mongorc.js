function prompt() {
  var username = 'Gilbert';
  var user = db.runCommand({ connectionStatus: 1 }).authInfo.authenticaredUsers[0];
  var host = db
    .getMongo()
    .toString()
    .split(' ')[2];
  var current_db = db.getName();

  if (!!user) {
    username = user.user;
  }

  return username + '@' + host + ':' + current_db + '> ';
}
