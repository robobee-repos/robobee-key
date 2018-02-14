CA_MAKE := ../ca_make

include $(CA_MAKE)/utils/Makefile.help
include $(CA_MAKE)/utils/Makefile.functions

# Makefile.
SHELL := /bin/bash
.DEFAULT_GOAL := all

PHONY: create
all: root etcd etcd-copy k8s k8s-copy ##@targets Creates all certificates.

PHONY: root
root: ##@targets Creates the root CA certificates.
	cd $(CA_MAKE) && $(MAKE)

PHONY: etcd
etcd: ##@targets Creates the etcd cluster certificates.
	cd $(CA_MAKE)/etcd_ca && $(MAKE)
	cd $(CA_MAKE)/etcd_ca && $(MAKE) server ETCD_SAN="IP:127.0.0.1, IP:10.0.1.10, IP:192.168.56.200, DNS:etcd-0.robobee-test.test" SERVER_NAME=etcd-0.robobee-test.test
	cd $(CA_MAKE)/etcd_ca && $(MAKE) server ETCD_SAN="IP:127.0.0.1, IP:10.0.1.10, IP:192.168.56.201, DNS:etcd-1.robobee-test.test" SERVER_NAME=etcd-1.robobee-test.test
	cd $(CA_MAKE)/etcd_ca && $(MAKE) server ETCD_SAN="IP:127.0.0.1, IP:10.0.1.10, IP:192.168.56.202, DNS:etcd-2.robobee-test.test" SERVER_NAME=etcd-2.robobee-test.test
	cd $(CA_MAKE)/etcd_ca && $(MAKE) client CLIENT_NAME=kube-0

PHONY: etcd-copy
etcd-copy:
	cp $(CA_MAKE)/etcd_ca/certs/ca_chain_cert.pem robobee_test_etcd_ca.pem
	cp $(CA_MAKE)/etcd_ca/certs/etcd-0.robobee-test.test_cert.pem robobee_test_etcd_etcd_0_server_cert.pem
	cp $(CA_MAKE)/etcd_ca/private/etcd-0.robobee-test.test_key_insecure.pem robobee_test_etcd_etcd_0_server_key.pem
	cp $(CA_MAKE)/etcd_ca/certs/etcd-1.robobee-test.test_cert.pem robobee_test_etcd_etcd_1_server_cert.pem
	cp $(CA_MAKE)/etcd_ca/private/etcd-1.robobee-test.test_key_insecure.pem robobee_test_etcd_etcd_1_server_key.pem
	cp $(CA_MAKE)/etcd_ca/certs/etcd-2.robobee-test.test_cert.pem robobee_test_etcd_etcd_2_server_cert.pem
	cp $(CA_MAKE)/etcd_ca/private/etcd-2.robobee-test.test_key_insecure.pem robobee_test_etcd_etcd_2_server_key.pem

PHONY: k8s
k8s: ##@targets Creates the k8s cluster certificates.
	cd $(CA_MAKE)/kubernetes_ca && $(MAKE)
	cd $(CA_MAKE)/kubernetes_ca && $(MAKE) server

PHONY: clean
clean: ##@targets Removes all generated certificates.
	cd $(CA_MAKE) && $(MAKE) clean
	rm *.pem

PHONY: k8s-copy
k8s-copy:
	cp $(CA_MAKE)/kubernetes_ca/certs/ca_chain_cert.pem robobee_test_kube_ca.pem
	cp $(CA_MAKE)/kubernetes_ca/private/ca_key_insecure.pem robobee_test_kube_key.pem
