update system.setting set vl = 'http://reports:8080' where name = 'report_server_url';
update system.setting set vl = '/reports' where name = 'reports_folder_url';
update system.setting set vl = '/cert/Claim_certificate' where name = 'claim_certificate_report_url';
update system.setting set vl = '1' where name = 'enable-reports';
update system.setting set vl = '' where name = 'db-utilities-folder';
update system.config_map_layer set title='Claims', url='http://localhost:8085/geoserver/opentenure/wms', wms_layers='opentenure:claims' where name = 'claims-orthophoto';