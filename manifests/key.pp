define cacert::key(
  $owner = root,
  $group = root
) {
  file{"/etc/pki/tls/private/$name.key":
    source => "puppet://$server/modules/site-cacert/keys/$name.key",
    owner => $owner, group => $group, mode => '440';
  }
}
