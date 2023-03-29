REPO_URLS=\
https://github.com/f5/unovis \
https://github.com/f5/otel-arrow-adapter \
https://github.com/f5/.github \
https://github.com/F5Networks/k8s-bigip-ctlr \
https://github.com/F5Networks/terraform-provider-bigip \
https://github.com/F5Networks/f5-openstack-agent \
https://github.com/F5Networks/f5-telemetry-streaming \
https://github.com/F5Networks/SecondSight \
https://github.com/F5Networks/f5-ansible-f5modules \
https://github.com/F5Networks/f5-ansible-bigip \
https://github.com/F5Networks/f5-ansible \
https://github.com/F5Networks/f5-cloud-libs \
https://github.com/F5Networks/terraform-azure-bigip-module \
https://github.com/F5Networks/terraform-gcp-bigip-module \
https://github.com/F5Networks/terraform-aws-bigip-module \
https://github.com/F5Networks/f5-ansible-f5os \
https://github.com/F5Networks/f5-appsvcs-templates \
https://github.com/F5Networks/f5-common-python \
https://github.com/F5Networks/f5-declarative-onboarding \
https://github.com/F5Networks/f5-openstack-lbaasv2-driver \
https://github.com/F5Networks/f5-cloud-libs-gce \
https://github.com/F5Networks/f5-cloud-libs-aws \
https://github.com/F5Networks/f5-cloud-libs-azure \
https://github.com/F5Networks/f5-ipam-controller \
https://github.com/F5Networks/charts \
https://github.com/F5Networks/f5-google-gdm-templates \
https://github.com/F5Networks/f5-azure-arm-templates \
https://github.com/F5Networks/f5-aws-cloudformation \
https://github.com/F5Networks/f5-azure-arm-templates-v2 \
https://github.com/F5Networks/f5-google-gdm-templates-v2 \
https://github.com/F5Networks/f5-aws-cloudformation-v2 \
https://github.com/F5Networks/f5-icontrol-rest-python \
https://github.com/F5Networks/f5-bigip-runtime-init \
https://github.com/F5Networks/f5-cloud-failover-extension \
https://github.com/F5Networks/f5-appsvcs-extension \
https://github.com/F5Networks/f5-aci-servicecenter \
https://github.com/F5Networks/f5-nfv-solutions \
https://github.com/F5Networks/f5-openstack-docs \
https://github.com/F5Networks/quickstart-f5-big-ip-virtual-edition-ha \
https://github.com/F5Networks/f5-ci-docs \
https://github.com/F5Networks/quic-lb \
https://github.com/F5Networks/f5-lbaas-dashboard \
https://github.com/F5Networks/f5-adcaas-openstack \
https://github.com/F5Networks/dynamic-taps \
https://github.com/F5Networks/f5-cloud-libs-openstack \
https://github.com/F5Networks/networking-f5 \
https://github.com/F5Networks/f5-openstack-image-prep \
https://github.com/F5Networks/f5-openstack-heat-plugins \
https://github.com/F5Networks/f5-openstack-heat \
https://github.com/F5Networks/f5-openstack-hot \
https://github.com/F5Networks/docker-images \
https://github.com/F5Networks/f5cs-sdk \
https://github.com/F5Networks/external-dns \
https://github.com/F5Networks/f5-cloud-iapps \
https://github.com/F5Networks/pytest-symbols \
https://github.com/F5Networks/f5-neutron-lbaas \
https://github.com/F5Networks/terraform-provider-bigip-version0.12 \
https://github.com/F5Networks/f5-cloud-libs-consul \
https://github.com/F5Networks/marathon-bigip-ctlr \
https://github.com/F5Networks/cf-bigip-ctlr \
https://github.com/F5Networks/f5-beacon \
https://github.com/F5Networks/f5-azure-stack-arm-templates \
https://github.com/F5Networks/f5-ipam-ctlr \
https://github.com/F5Networks/neutron-lbaas-dashboard \
https://github.com/F5Networks/f5-vmware-vcenter-templates \
https://github.com/F5Networks/f5-neutron-lbaas-dashboard-docs \
https://github.com/F5Networks/bigsuds \
https://github.com/F5Networks/neutron-lbaas \
https://github.com/F5Networks/f5networks.github.io \
https://github.com/F5Networks/f5-cloud-workers \
https://github.com/F5Networks/f5-automation-labs \
https://github.com/F5Networks/f5-openstack-test \
https://github.com/F5Networks/f5-openstack-lbaasv1 \
https://github.com/F5Networks/pytest_f5sdk \
https://github.com/F5Networks/linerate_api_docs \
https://github.com/F5Networks/neutron-specs 

rank:
	node tools/git-pulse-rank.js

clones:
	mkdir build || true; \
	cd build; \
	for url in $(REPO_URLS); do \
		git clone $$url || true; \
	done

snapshots:
	cd build; \
	for dir in */; do \
		cd $$dir && git pull && time bash ../../tools/git-pulse; \
		cp *$$(date +"%Y-%m-%d")-pulse.* ../..; \
		cd ..; \
	done;

