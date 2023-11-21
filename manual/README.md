cert-mgr NSS DB persister
==========================

This is a simple POC of how to use Openshift North-South IPsec with cert-mgr


How to use:
------------
1. prerequisits:
   a. OCP with cert-mgr operator installed
   b. North-South IPsec enabled
2. Preparation - apply everything under the prepare dir. 
   this includes the CA issuer
3. actual work - apply everything under the nss-integration dir
