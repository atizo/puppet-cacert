define cacert::cert(
  $owner = root,
  $group = root
) {
  file{"/etc/pki/tls/certs/$name.crt":
    source => "puppet://$server/modules/site-cacert/certs/$name.crt",
    owner => $owner, group => $group, mode => '440';
  }
}
