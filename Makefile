BUILD_DIR=./build

.PHONY: build
build: clean
	mkdir -p $(BUILD_DIR)
	wget -P $(BUILD_DIR) https://github.com/runabove/haproxy-exporter/archive/v$(VERSION).zip
	unzip -q -d $(BUILD_DIR) $(BUILD_DIR)/v$(VERSION).zip
	cd $(BUILD_DIR)/haproxy-exporter-$(VERSION) && glide install
	cd $(BUILD_DIR)/haproxy-exporter-$(VERSION) && make release
	mv $(BUILD_DIR)/haproxy-exporter-$(VERSION)/build/haproxy-exporter $(BUILD_DIR)/

.PHONY: deb
deb:
		rm -f haproxy-exporter*.deb
		fpm -m "<kevin@d33d33.fr>" \
		  --description "Export HAProxy stats to Sensision Metrics" \
			--url "https://github.com/runabove/haproxy-exporter" \
			--license "BSD-3-Clause" \
			--version $(shell echo $$(./build/haproxy-exporter version | awk '{print $$2}')) \
			-n haproxy-exporter \
			-d logrotate \
			-s dir -t deb \
			-a all \
			--deb-user haproxy-exporter \
			--deb-group haproxy-exporter \
			--deb-no-default-config-files \
			--config-files /etc/haproxy-exporter/config.yaml \
			--deb-init deb/haproxy-exporter.init \
			--directories /opt/haproxy-exporter \
			--directories /var/log/haproxy-exporter \
			--before-install deb/before-install.sh \
			--after-install deb/after-install.sh \
			--before-upgrade deb/before-upgrade.sh \
			--after-upgrade deb/after-upgrade.sh \
			--before-remove deb/before-remove.sh \
			--after-remove deb/after-remove.sh \
			--inputs deb/input

.PHONY: clean
clean:
		rm -rf build
		rm -f *.deb
