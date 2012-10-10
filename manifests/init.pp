#
# cacert module
#
# Copyright 2010, Atizo AG
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class cacert {
  file{'/etc/pki/tls/certs/cacert-ca-class-1.crt':
    source => "puppet://$server/modules/cacert/cacert-ca-class-1.crt",
    owner => root, group => root, mode => '444';
  }
  file{'/etc/pki/tls/certs/cacert-ca-class-3.crt':
    source => "puppet://$server/modules/cacert/cacert-ca-class-3.crt",
    owner => root, group => root, mode => '444';
  }

  # refresh all services on cert or key change
  File['/etc/pki/tls/certs/cacert-ca-class-1.crt']
  ~>File['/etc/pki/tls/certs/cacert-ca-class-3.crt']
  ~>Cacert::Cert <| |>
  ~>Cacert::Key <| |>
  ~>Service <| |>
}
