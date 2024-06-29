update system.setting set vl = '1' where name = 'enable-reports';
update system.setting set vl = '' where name = 'db-utilities-folder';
update system.config_map_layer set title='Claims', url='http://localhost:8085/geoserver/opentenure/wms', wms_layers='opentenure:claims' where name = 'claims-orthophoto';