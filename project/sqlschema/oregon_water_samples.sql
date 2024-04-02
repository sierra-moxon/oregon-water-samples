-- # Class: "NamedThing" Description: "A generic grouping for any identifiable entity"
--     * Slot: id Description: A unique identifier for a thing
-- # Class: "BioSample" Description: "A hypothetical collection of attributes that represent a sample of water from a specific  location and depth with associated bacterial composition."
--     * Slot: depth Description: The depth of the water sample in centimeters
--     * Slot: sample_type Description: The type of sample
--     * Slot: latitude Description: The latitude of the water sample
--     * Slot: longitude Description: The longitude of the water sample
--     * Slot: id Description: A unique identifier for a thing
--     * Slot: BioSampleCollection_id Description: Autocreated FK slot
-- # Class: "BioSampleCollection" Description: "A holder for BioSample objects"
--     * Slot: id Description: 
-- # Class: "BioSample_bacteria" Description: ""
--     * Slot: BioSample_id Description: Autocreated FK slot
--     * Slot: bacteria Description: The bacteria, represented by a NCBITaxon identifier, present in a sample

CREATE TABLE "NamedThing" (
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE "BioSampleCollection" (
	id INTEGER NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE "BioSample" (
	depth FLOAT, 
	sample_type TEXT, 
	latitude FLOAT, 
	longitude FLOAT, 
	id TEXT NOT NULL, 
	"BioSampleCollection_id" INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY("BioSampleCollection_id") REFERENCES "BioSampleCollection" (id)
);
CREATE TABLE "BioSample_bacteria" (
	"BioSample_id" TEXT, 
	bacteria TEXT, 
	PRIMARY KEY ("BioSample_id", bacteria), 
	FOREIGN KEY("BioSample_id") REFERENCES "BioSample" (id)
);