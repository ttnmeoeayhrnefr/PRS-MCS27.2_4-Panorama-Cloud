install:
	cd terraform && make install-terraform
	cd terraform && make install-aws
	chmod 600 ./docs/admin.pem

configure:
	cd terraform && make configure-aws

configure-aws_session_token:
	cd terraform && make configure-aws_session_token

tp:
	cd terraform && make ipa