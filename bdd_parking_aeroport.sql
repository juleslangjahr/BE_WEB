CREATE DATABASE IF NOT EXISTS bdd_parking_aeroport;
USE bdd_parking_aeroport;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database:  bdd_parking_aeroport 
--

-- --------------------------------------------------------

--
-- Table structure for table  Clients 
--

CREATE TABLE  Clients(
   idClient int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table  Clients_inscrits 
--

CREATE TABLE  Clients_inscrits(
   idClient int(11) NOT NULL,
   identifiant text NOT NULL,
   mdp text NOT NULL,
   PMR tinyint(1) NOT NULL,
   nom text NOT NULL,
   prenom text NOT NULL,
   telephone int(11) NOT NULL,
   email text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table  Factures 
--

CREATE TABLE  Factures(
   idClient int(11) NOT NULL,
   idFacture int(11) NOT NULL,
   idLocation int(11) NOT NULL,
   paiement text NOT NULL,
   prix float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table  Locations 
--

CREATE TABLE  Locations(
   idClient int(11) NOT NULL,
   idLocation int(11) NOT NULL,
   idPlace int(11) NOT NULL,
   debut datetime NOT NULL,
   fin datetime NOT NULL,
   dateLocation date NOT NULL,
   paiement text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table  Parking 
--

CREATE TABLE  Parking(
   idParking int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table  PlaceParking 
--

CREATE TABLE  PlaceParking(
   idPlace int(11) NOT NULL,
   idZone int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table  Réservations 
--

CREATE TABLE  Réservations(
   idClient int(11) NOT NULL,
   debut datetime NOT NULL,
   fin datetime NOT NULL,
   dateReservation date NOT NULL,
   idPlace int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table  Véhicules 
--

CREATE TABLE  Véhicules(
   idClient int(11) NOT NULL,
   plaque text NOT NULL,
   type text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table  ZoneParking 
--

CREATE TABLE  ZoneParking(
   idZone int(11) NOT NULL,
   idParking int(11) NOT NULL,
   tarif float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table  Clients 
--
ALTER TABLE  Clients 
  ADD PRIMARY KEY ( idClient );

--
-- Indexes for table  Clients_inscrits 
--
ALTER TABLE  Clients_inscrits 
  ADD KEY  idClient ( idClient );

--
-- Indexes for table  Factures 
--
ALTER TABLE  Factures 
  ADD PRIMARY KEY ( idFacture ),
  ADD KEY  idClient ( idClient ),
  ADD KEY  idLocation ( idLocation );

--
-- Indexes for table  Locations 
--
ALTER TABLE  Locations 
  ADD PRIMARY KEY ( idLocation ),
  ADD KEY  idClient ( idClient ),
  ADD KEY  idPlace ( idPlace );

--
-- Indexes for table  Parking 
--
ALTER TABLE  Parking 
  ADD PRIMARY KEY ( idParking );

--
-- Indexes for table  PlaceParking 
--
ALTER TABLE  PlaceParking 
  ADD PRIMARY KEY ( idPlace ),
  ADD KEY  idZone ( idZone );

--
-- Indexes for table  Réservations 
--
ALTER TABLE  Réservations 
  ADD KEY  idClient ( idClient ),
  ADD KEY  idPlace ( idPlace );

--
-- Indexes for table  Véhicules 
--
ALTER TABLE  Véhicules 
  ADD KEY  idClient ( idClient );

--
-- Indexes for table  ZoneParking 
--
ALTER TABLE  ZoneParking 
  ADD PRIMARY KEY ( idZone ),
  ADD KEY  idParking ( idParking );
