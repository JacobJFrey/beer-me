BEGIN TRANSACTION;

DROP TABLE IF EXISTS brewery;
DROP TABLE IF EXISTS beer;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS beerType;
DROP TABLE IF EXISTS history;

DROP SEQUENCE IF EXISTS brewery_breweryId_seq;

CREATE SEQUENCE brewery_breweryId_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE brewery (
    breweryId integer DEFAULT nextval('brewery_breweryId_seq'::regclass) NOT NULL,
    name varchar(50) NOT NULL,
    address varchar(100) NOT NULL,
    locationId integer NOT NULL,
    hasFood boolean,
    beerId integer,
    description varchar(1000),
    visited boolean DEFAULT FALSE,
    CONSTRAINT pk_brewery_breweryId PRIMARY KEY (breweryId)
);

CREATE TABLE beer (
    beerId integer NOT NULL,
    name varchar(50) NOT NULL,
    typeId integer NOT NULL,
    description varchar(1000),
    CONSTRAINT pk_beer_beerId PRIMARY KEY (beerId)
);

CREATE TABLE location (
    locationId integer NOT NULL,
    city varchar(40) NOT NULL,
    direction varchar(15) NOT NULL,
    CONSTRAINT pk_location_locationId PRIMARY KEY (locationId)
);

CREATE TABLE beerType (
    typeId integer NOT NULL,
    name varchar(20),
    CONSTRAINT pk_beerType_typeId PRIMARY KEY (typeId)
);

CREATE SEQUENCE history_historyId_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE history (
    historyId integer DEFAULT nextval('history_historyId_seq'::regclass),
    breweryName varchar(50),
    date date,
    CONSTRAINT pk_history_historyId PRIMARY KEY (historyId)
);

ALTER TABLE brewery ADD FOREIGN KEY (beerId) REFERENCES beer(beerId);
ALTER TABLE brewery ADD FOREIGN KEY (locationId) REFERENCES location(locationId);
ALTER TABLE beer ADD FOREIGN KEY (typeId) REFERENCES beerType(typeId);


-- Add cities first
INSERT INTO location (locationId, city, direction)
VALUES (1, 'Pittsburgh', 'Downtown');
INSERT INTO location (locationId, city, direction)
VALUES (2, 'Sharpsburg', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (3, 'Lawrenceville', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (4, 'Millvale', 'North');
INSERT INTO location (locationId, city, direction)
VALUES (5, 'Polish Hill', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (6, 'Heidelberg', 'West');
INSERT INTO location (locationId, city, direction)
VALUES (7, 'Braddock', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (8, 'Homestead', 'South');
INSERT INTO location (locationId, city, direction)
VALUES (9, 'Larimer', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (10, 'Squirrel Hill', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (11, 'Shadyside', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (12, 'South Side', 'South');
INSERT INTO location (locationId, city, direction)
VALUES (13, 'North Shore', 'North');
INSERT INTO location (locationId, city, direction)
VALUES (14, 'Troy Hill', 'North');
INSERT INTO location (locationId, city, direction)
VALUES (15, 'Mckees Rocks', 'West');
INSERT INTO location (locationId, city, direction)
VALUES (16, 'Castle Shannon', 'South');
INSERT INTO location (locationId, city, direction)
VALUES (17, 'Bethel Park', 'South');
INSERT INTO location (locationId, city, direction)
VALUES (18, 'Glenshaw', 'North');
INSERT INTO location (locationId, city, direction)
VALUES (19, 'Bellevue', 'North');
INSERT INTO location (locationId, city, direction)
VALUES (20, 'Coraopolis', 'West');
INSERT INTO location (locationId, city, direction)
VALUES (21, 'Oakdale', 'West');
INSERT INTO location (locationId, city, direction)
VALUES (22, 'Elizabeth', 'South');
INSERT INTO location (locationId, city, direction)
VALUES (23, 'Irwin', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (24, 'Verona', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (25, 'Springdale', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (26, 'Export', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (27, 'Delmont', 'East');
INSERT INTO location (locationId, city, direction)
VALUES (28, 'Emsworth', 'West');

-- Beer types
INSERT INTO beerType (typeId, name)
VALUES (1, 'India Pale Ale');
INSERT INTO beerType (typeId, name)
VALUES (2, 'Ale');
INSERT INTO beerType (typeId, name)
VALUES (3, 'Lager');
INSERT INTO beerType (typeId, name)
VALUES (4, 'Stout');
INSERT INTO beerType (typeId, name)
VALUES (5, 'Red Ale');
INSERT INTO beerType (typeId, name)
VALUES (6, 'Pilsner');
INSERT INTO beerType (typeId, name)
VALUES (7, 'Wheat');
INSERT INTO beerType (typeId, name)
VALUES (8, 'Pumpkin');
INSERT INTO beerType (typeId, name)
VALUES (9, 'Pale Ale');
INSERT INTO beerType (typeId, name)
VALUES (10, 'Brown Ale');
INSERT INTO beerType (typeId, name)
VALUES (11, 'Cider');
INSERT INTO beerType (typeId, name)
VALUES (12, 'Dunkelweizen');
INSERT INTO beerType (typeId, name)
VALUES (13, 'Cream Ale');
INSERT INTO beerType (typeId, name)
VALUES (14, 'Porter');

-- Most popular beer per Untapped, Description also from untapped
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (1, 'Rt. 113 IPA', 1, '7% ABV : This complex, aromatic beer is brewed with an abundance of the finest hops from the Pacific Northwest and England. Every sip will remind you of just why you fell in love with craft beer in the first place.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (2, 'Bane of Existence', 1, '6.6% ABV');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (3, 'Lustra', 9, '5.8% ABV : Intense tropical and citrus fruit aromas and a clean fruity bitterness work in harmony with the lightly toasted wheat bread flavors derived from the malt.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (4, 'Hop Farm IPA', 1, '6.5% ABV');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (5, 'Ginga Wheat', 7, '5% ABV : American wheat beer with fresh pressed ginger, honey, and lemon.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (6, 'R2 Koelschip', 2, '4.2% : Belgian style Farmhouse ale in dedication to our first coolship (koelschip), nicknamed R2.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (7, 'Hazedelic Juice Grenade', 1, '6.4% ABV : This super hazy New England Style IPA explodes in your mouth with creamy notes of orange and mango. It finishes with a smooth and inviting bitterness that makes you ready to pull the pin on your next pint!');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (8, 'Cult Logic', 1, '6.8% ABV : A Double Dry Hopped, soft as hell, Hazy IPA with Australian Enigma, Denali and experimental hop BRU-1. This beer hits all the important fruit groups with Pineapple, fresh melon, peach, mango, Naval oranges and blueberry playing a major role.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (9, 'Squish', 9, '5% ABV : Our eminently crushable house pale ale hopped thoughtfully to evoke sticky mango, candied pineapple, tangerine zest, and pine needles. Equal parts crisp and round on the mouthfeel, finishing fairly dry. Low bitterness, soft and juicy. Light golden and hazy.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (10, 'I.C. Light', 3, '4.2% ABV : The only premium light lager that embodies all things black & gold, I.C. Light is brimming with bold iron city flavor.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (11, 'Fighting Elleck Hard Apple Cider', 11, '8.2% ABV : This is our off-dry cider. Named after Alexander Hayes, the fightin Elleck, who is buried locally at Allegheny Cemetery.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (12, 'ThunderHop IPA', 1, '6.5% ABV : Light body and color create a canvas for the hops to shine. Australian Galaxy, American Palisade and German Mandarina Bavaria hops lend juicy and tropical notes to the beers aroma.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (13, 'Super Galaxy Sasquatch', 1, '8% ABV : Single-hopped with Galaxy, Galaxy & more Galaxy. Then double dry-hopped with Galaxy.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (14, 'General Braddocks IPA', 1, '6.8% ABV : Soft & balanced American IPA. A beer you can always come back to.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (15, 'Love Child', 2, '9.2% ABV : Voodoo Love Child is our Gran Met aged on passion fruit, cherries, and raspberries. This ale is inspired by fun, flavor, and a passion for brewing.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (16, 'India Pale Ale', 1, '6.5% ABV : This classic, golden-hued ale is brewed with the finest hand-selected hops from the Pacific Northwest for an assertive, citrus hop flavor.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (17, 'Big Hop', 9, '5.8% ABV : Centennial and Cascade hops make this a truly American Ale, brewed to be hoppy but not especially bitter, balanced with a solid Munich Malt backbone.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (18, 'Ottoman Empire', 1, '9.2% ABV : Be the commander of our hops army. Four varieties of hops will reign supreme and conquer your desire for the best double ipa ever brewed. Put your feet on an ottoman and rule the Living Room with an Ottoman Empire in hand.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (19, 'BrewDog VS Evil Twin', 4, '9% ABV : Darker than Evil and smoother than a late show host. Chocolate, bitter espresso, and vanilla ride up front, closely tailgated by roasty, nutty notes. Oats and wheat round things out with nitro delivering a supersonic smooth ride.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (20, 'Dunkle', 12, '5.5% ABV');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (21, 'Oceanic', 1, '6.6% ABV : Hazy IPA with Citra, Galaxy and Motueka hops');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (22, 'Afternoon', 9, '4.5% ABV : AFTERNOON is our modest pale ale, around 30 IBU, brewed with a mix of old and new world hops, several Belgian yeast strains');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (23, 'Penn Pilsner', 6, '5% ABV : Amber-colored with a malty nose and a touch of Noble hops, Penn Pilsner has caramel and toffee notes as well as toasted, nutty hints.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (24, 'Matcha Tea Milkshake Ale', 2, '5.3% ABV : Brewed with wheat, flaked wheat, flaked oats, oat flour, and milk sugar (lactose) for a full body with a residue sweetness. Then conditioned with a ridiculous amount of Madagascar vanilla beans and a calculated amount of Matcha green tea powder. Served on nitro for added creaminess, body and a whipped cream like head. The aroma and flavor of this beer is strong vanilla and Matcha green tea.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (25, '2 Hour Delay', 10, '8.6% ABV : Imperial brown ale brewed with honey');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (26, 'Palo Alto Pale Ale', 9, '6.5% ABV : A hoppy American style pale ale, with tropical hop flavors and aromas. Eukanot, cascade, amarillo and citra hops create the tropical hop profile of this light pale ale.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (27, 'Red Brain', 5, '6% ABV : A balanced beer, with toasted malt characters, a light fruitiness and a lightly spicy, floral hop finish . Our Amber is brewed with 2-row Pale, Crystal, Amber and Chocolate malts.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (28, 'Killer Diller', 1, '6.8% ABV');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (29, 'Head Hunter IPA', 1, '7.5% ABV : Uncivilized and aggressive, this West Coast styled IPA packs wicked hop flavors and aroma. World Beer Cup Silver 2012. GABF Silver 2010, Bronze 2011. National IPA Championship Winner 2012, 2010.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (30, 'Pumpking', 8, '8.6% ABV : Pumpkin puree and pie spices, malty, bready; cinnamon dominates with nutmeg and vanilla in the background.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (31, 'Serendipity IPA', 1, '7.2% ABV : Serendipity is the occurrence of an unplanned fortunate discovery — AND an incredibly drinkable IPA.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (32, '511 NE IPA', 12, '6.8% ABV');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (33, 'Quittin Time Cream Ale', 13, '4.6% ABV : Our unique blend of flaked rice and corn mixed with specialty grains produce a light-bodied ale. Youll be counting down the time to "Beer O Clock!"');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (34, 'Black Bear', 1, '6.7% ABV : American Black Ale... Pitch black in color and showcases malty and moderate roast notes. It is quite happy as it uses 4 different American hop varieties through the brewing and fermentation process.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (35, 'American IPA', 1, '6.5% ABV');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (36, 'Flash Lightning Speed Porter', 14, '5.2% ABV : This delicious porter is different from most porters you have had before - easy drinking, not super high in alcohol and goes down so easy it will be gone in a flash.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (37, 'Oh, Jack-o-lantern', 8, '9.1% ABV : An imperial pumpkin ale that will make you go bump in the night. Clove, vanilla, cinnamon, and nutmeg fill in the chilly night air. The finish surprises you like bubbles from a couldron. This spooky tale of an ale is perfect with chocolate and sweet harvest fruits.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (38, 'Luckys Black IPA', 1, '6.5% ABV');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (39, 'Lunar Weizen', 7, '5.7% ABV');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (40, 'Sids 1k IPA', 1, '7.1% ABV : This West coast meets east coast IPA is brewed with Warrior, Amarillo and Citra hops. Slight bitterness up front rounds off to a most enjoyable finish. We brewed this beer in honor of Sidney Crosbys 1000 point!');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (41, 'Milkshake NEIPA Series: Blackberry', 1, '6.3% ABV : Lactose, vanilla bean, and over a lb of hops (Pacific Gem, Huell Melon, Galaxy, Amarillo, Rakau, Citra) Then finished with 7 lbs of blackberry puree.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (42, 'First Born Unicorn', 9, '5.7% ABV');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (43, 'Midnight Moo', 1, '7% ABV : Roasted Malts | coffee | Combination of IPA & Stout | Dark Explosion of Hops: Centennial, Willamette & Cascade');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (44, 'Mischievous Brown Ale', 10, '5.5% ABV : This traditional southern English style brown ale, combines European malts with American hops. The result is a rich, malty, full-bodied ale, with a subtle hint of fruitiness on the nose and palate.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (45, 'Dude Wanted Juice', 1, '6.5% ABV : An intense nose of Citra and Amarillo hops followed up with a soft and smooth finish with pleasant lingering bitterness.');
INSERT INTO BEER (beerId, name, typeId, description)
VALUES (46, 'Aurochs Session IPA', 1, '4.59% ABV : A hop driven beer with citrus, pine, lemon, melon and grapefruit flavors. Brewed with millet & quinoa.');

-- breweries in & around pittsburgh
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Sly Fox', '300 Liberty Ave Suite 100', TRUE, 1, 1, 'Sly Fox Brewing Company is headquartered in Pottstown, Pennsylvania. This taphouse location near Point State Park'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Hitchhiker Brewing', '1500 S Canal St', TRUE, 2, 2, 'Were a brewery devoted to progressive and traditional style beers. Located in the Pittsburgh neighborhoods of Mt. Lebanon and Sharpsburg.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Dancing Gnome', '925 Main St', TRUE, 2, 3, 'We unapologetically brew hop pronounced styles and believe in the process of designing, refining, and perfecting our creations. With the understanding and appreciation of tradition, we take calculated liberties to forge a new path for the American Ale. We believe in eudaimonia, indulgence, and a harmonious blend of earnest work and ebullient play. We believe in the dichotomy of reverent traditions and brazen pioneers.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Hop Farm', '5601 Butler St', TRUE, 3, 4, 'Hop Farm Brewing company is a independently partner owned brewery by Matthew and Emily Gouwens, in the Lawrenceville neighborhood of Pittsburgh Pennsylvania. Our focus is on sustainability and local sourcing while producing hoppy ales, farmhouse ales, sour ales and various other interesting brews.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Roundabout', '4901 Butler St', FALSE, 3, 5, 'Yield to quality craft beer'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Strange Roots', '501 E Ohio St', TRUE, 4, 6, 'Strange Roots exists at the intersection of farmhouse brewing tradition and creative, locally-driven experimentation. We’re passionate about celebrating our environment through the use of local ingredients, varying fermentation methods and micro flora, and strive to create unique artisan ales inspired by our surroundings here in the foothills of the Allegheny Mountains.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Grist House', '10 E Sherman St', TRUE, 4, 7, 'Grist House Craft Brewery is located in the heart of Millvale, PA just minutes north of downtown Pittsburgh. Family owned and operated, we strive to produce high quality beer that is delicious and easy drinking. The brewery is loaded with character, from our taproom overlooking the brew system, our all-season deck and spacious outdoor seating area, to our tap handles hand crafted by a local blacksmith.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Eleventh Hour', '3711 Charlotte St', FALSE, 3, 8, 'Our approach is "We love beer, so why not make a career out of it?!?" With this in mind, we do everything we can to further our love affair with the wonderful fermented beverage we have all come to know and love! Beer can be simple and beer can be complex. We dont subscribe to one methodology or the other because if its good then we drink it (and therefore we will also brew it).'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Cinderlands', '3705 Butler St', TRUE, 3, 9, 'A Craft Brewery & Scratch Kitchen located in Pittsburgh, PA'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Iron City Brewing', '3340 Liberty Ave', TRUE, 5, 10, 'Since 1861, Pittsburgh Brewing Company has always been committed to a few things: deep roots in the Pittsburgh community, strong tradition, innovation, and of course, brewing great beer. Weve been at it for 150 years, and with every bottle we keep getting better.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Arsenal Cider House', '300 39th St', FALSE, 3, 11, 'Arsenal Cider House and Wine Cellar is a U.S. Civil War thematic winery specializing in small batch, hand crafted hard apple cider, "cider style" fruit/grape wines, & mead. Located just a few steps from the historic Allegheny Arsenal, our name sake, we are dedicated to providing high quality products, in a friendly nostalgic atmosphere.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('The Church Brew Works', '3525 Liberty Ave', TRUE, 3, 12, 'Former church is now a lofty space for house-brewed beers, plus a mix of pizza, pierogi & bratwurst.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Insurrection Aleworks', '1635 E Railroad St', TRUE, 6, 13, 'Handcrafted, small batch artisan ales specializing in saisons, sours, wild ales & hoppy beers. All our beers are naturally carbonated.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Brew Gentlemen', '512 Braddock Ave', TRUE, 7, 14, 'Brew Gentlemen aims to create soft, balanced and elegant beers and meaningful experiences while helping revitalize the historic steel town of Braddock, Pennsylvania.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Voodoo Brewing Co', '205 E 9th Ave', TRUE, 8, 15, 'The Employee Owners of Voodoo Brewing Co. have taken our brewing experiences and quirky personalities and wrapped it up into a line of beers oriented around what we feel are fun, flavorful, and thought-provoking. We wish you enjoy our beers as much as we do brewing them.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Rock Bottom Brewery', '171 East Bridge St', TRUE, 8, 16, 'Brewpub chain serving house beers & upscale pub food & American fare in lively environs.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('East End', '147 Julius St', FALSE, 9, 17, 'Local brewery offering tours, a tasting room & house beers for sale by the growler or keg.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Couch Brewery', '1351 Washington Blvd', TRUE, 9, 18, 'Couch is probably unlike any brewery you’ve visited. Retro, vintage, a disco ball and even a little bit kitchy. And we brew some of the finest beer.  And we serve some of the finest Pennsylvania spirits, wine, mead and ciders too.'); 
INSERT INTO brewery (name, address, hasFood, locationId, description)
VALUES ('Independent Brewing Company', '1704 Shady Ave', TRUE, 10, 'Beers brewed in Western Pennsylvania & upscale American grub featured in a relaxed tavern.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('BrewDog USA', '6144 Centre Ave', TRUE, 11, 19, 'Serving up our US-brewed beers and a range of incredible food for anybody who would love to come by and see us. The craft beer scene in America is inspirational to us – from our base in Columbus we are proud to be a part of it.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Hofbrauhaus Pittsburgh', '2705 S Water St', TRUE, 12, 20, 'German brewery modeled like the Munich original has seasonal beer, Bavarian fare & costumed servers.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Allegheny City Brewing', '507 Foreland St', FALSE, 13, 21, 'Neighborhood brewery in the historic Deutschtown neighborhood of Pittsburgh.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Spring Hill Brewing', '1958 Varley St', FALSE, 14, 22, 'The brewery is located inside of the WBU building, which sits atop a several acre plot of land in Spring Hill.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Penn Brewery', '800 Vinial St', TRUE, 14, 23, 'Pittsburgh’s oldest and largest brewery, Penn is housed in the mid nineteenth-century landmark E&O Brewery Building in the North Side’s Deutschtown neighborhood, which was settled by German immigrants. Penn has been producing high-end craft beers since 1986.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Abjuration Brewing', '644 Broadway Ave', FALSE, 15, 24, 'Open source small batch brewery.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('412 Brewery', '847 Western Ave', FALSE, 13, 25, 'Hand-Crafted Micro Brews Designed For Taste, smoothness, and quality. Each of our beer recipes uses only the finest hops, wheat, barley, and other ingredients to combine for a fine tasting brew. The smoothness of each swallow is unsurpassed.');
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('War Streets', '902 Western Ave', TRUE, 13, 26, 'Biers Pub and War Streets Brewery have teamed up to exclusively offer their brews at the pub. The taproom is now open!'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Mindful Brewing', '3759 Library Rd', TRUE, 16, 27, 'House brews & more flow from the many taps at this casual brewpub with comfort fare & a bottle shop.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Spoonwood Brewing', '5981 baptist Rd', TRUE, 17, 28, 'Spoonwood Brewing Company is located at the former home of the Montour Railroad. Over the past 50 years, the site has transformed from a concrete railroad arch to a restaurant designed from two railcars.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Fat Heads Saloon', '1805 E Carson St', TRUE, 12, 29, 'Hand crafted ales and lagers, brewed in small batches from the finest ingredients.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Southern Tier', '316 N Shore Dr', TRUE, 13, 30, 'Southern Tier was founded in 2002 by Phin and Sara DeMink in Lakewood, New York. It is known for its diverse portfolio of innovative beers that embodies the spirit of American craft brewing.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Acrospire Brewing Company', '1650 Butler Plank Rd', FALSE, 18, 31, 'Located in Glenshaw, PA, Acrospire Brewing is a small craft brewery focusing on traditional brewing methods and ingredients. Acrospire Brewing Company, was formed in December 2017, by three friends who had a common love of great craft beer and a desire to share it with as many people as possible.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Lincoln Avenure Brewing', '538 Lincoln Ave', TRUE, 19, 32, 'Local brewery with a tasting room & house beers for sale by the growler.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('180 And Tapped', '2010A State Ave', FALSE, 20, 33, 'Were doing a complete 180!​Our brand is about turning it around. Turn your night around with our hand crafted beers. Turn our local communities around by donating a portion of all proceeds to tremendous causes in the region.​Weve turned our lives around to go in a better direction, our own! 180 and Tapped is based on a belief that brewing should be authentic, genuine, and true. Our beers inspire a generation to be bold and take the path for something better.​'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Cobblehaus Brewing Co', '1021 5th Ave', FALSE, 20, 34, 'Cobblehaus is a small batch craft brewery located in Coraopolis, PA. We are inspired by the "Olde World" traditional styles from Germany and Belgium and many of our brews are consistent with those recipes and flavors. With that said, we also love to switch things up with some "New World" twists. As we showcase the different beers in the newsletter, you will see how the two blend together in harmony.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Helicon Brewing', '102 Union Ave', FALSE, 21, 35, 'Helicon is a production brewery and not a brewpub, we encourage you to be creative and BYOF (Bring your own food). We will have an extremely limited menu of some simple snacks, however there are several excellent restaurants within walking distance of the brewery.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Headleys Brewing', '1743 Railroad St', FALSE, 6, 36, 'Brewery located in Heidelberg');
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Firewhistle Brewing', '113 S 2nd Ave', FALSE, 22, 37, 'Brewery located in Elizabeth'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Quinn Brewing Company', '3000 Commerce Loop', FALSE, 23, 38, 'We are a company that focuses on traditionally brewing authentic beer made from all natural products, patience and pride.  We strive for positivity in everything that we do.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('New Crescent Brewing', '229 Main St', FALSE, 23, 39, 'We are a small five-barrel brewery and taproom located in downtown Irwin, PA.');
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Fury Brewing', '13380 US 30', TRUE, 23, 40, 'We brew small batches to insure fresh beer is always on tap. Look on Facebook, Instagram and twitter for updates on whats going on at Fury!'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Acclamation Brewing', '555 Wildwood Ave', FALSE, 24, 41, 'Small 3.5 barrel brewery focused on sessionable beer.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Inner Groove Brewing', '751 E Railroad Ave', FALSE, 24, 42, 'Inner Groove Brewings mission is to provide an exceptional craft beer experience with every glass.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('The Leaning Cask Brewing Company', '850 Pittsburgh St', TRUE, 26, 43, 'We are a craft brewery in the Pittsburgh area. Inspired by our love for British style beers, we produce craft ales that are brewed with the finest sourced ingredients and traditional English brewing methods with a modern American influence on style.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Helltown Brewing', '5578 Old William Penn Hwy', TRUE, 27, 44, 'Craft brewery in located in Western Pennsylvania with two tap rooms in Export and Mt Pleasant.'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Yellow Bridge Brewing', '2266 PA-66', FALSE, 28, 45, 'Yellow Bridge is a premier local beer destination in western Pennsylvania offering a wide variety of delicious brews!'); 
INSERT INTO brewery (name, address, hasFood, locationId, beerId, description)
VALUES ('Aurochs Brewing Company', '8321 Ohio River Blvd', FALSE, 28, 46, 'This microbrewery making ales that are naturally gluten-free also offers a taphouse for beer sales.'); 

COMMIT TRANSACTION;