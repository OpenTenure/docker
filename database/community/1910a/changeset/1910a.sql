ALTER TABLE opentenure.claim ALTER COLUMN nr TYPE character varying(40) USING nr::character varying(15);
ALTER TABLE opentenure.claim_historic ALTER COLUMN nr TYPE character varying(40) USING nr::character varying(15);