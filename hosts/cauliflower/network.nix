{lib, pkgs, ... }:
{
	networking = {
		interfaces.enp2s0= {
			ipv4.addresses = [{
				address = "192.168.1.175";
				prefixLength = 24;
			}];
		};
		defaultGateway = {
			address = "192.168.1.1";
			interface = "enp2s0";
		};
	};

	networking.wg-quick.interfaces = {
		wg0 = {
			address = [ "10.34.223.186/16" ];
			dns = [ "10.35.53.1" ];
			privateKeyFile = "/home/dillen/wg-secret.key";

			peers = [{
				publicKey = "W31EZNwNi1bhP+Y1L+8QU6Q5snHFJWg+neN7J7934wQ=";
				allowedIPs = [ "0.0.0.0/0" ];
				endpoint = "ch-zur.pvdata.host:3389";
				}];
		};
	};


}
