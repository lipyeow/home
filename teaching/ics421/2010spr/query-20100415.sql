-- -----------------------------------------
-- Query100
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))

;
-- -----------------------------------------
-- Query101
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.zoneid BETWEEN FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)
            AND FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))

;
-- -----------------------------------------
-- Query102
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.ra BETWEEN ((67.5)-( 1.0/60.0)) AND ((67.5)+( 1.0/60.0)))
AND
(O.dec BETWEEN (( +0.5)-( 1.0/60.0)) AND (( +0.5)+( 1.0/60.0)))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))

;
-- -----------------------------------------
-- Query103
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.objid BETWEEN BIGINT(FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333)*10000000000000))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))

;
-- -----------------------------------------
-- Query110
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query111
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.zoneid BETWEEN FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)
            AND FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query112
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(D.objid BETWEEN BIGINT(FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333)*10000000000000))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query113
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.zoneid BETWEEN FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)
            AND FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333))
AND
(D.objid BETWEEN BIGINT(FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333)*10000000000000))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query114
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.ra BETWEEN ((67.5)-( 1.0/60.0)) AND ((67.5)+( 1.0/60.0)))
AND
(O.dec BETWEEN (( +0.5)-( 1.0/60.0)) AND (( +0.5)+( 1.0/60.0)))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query115
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.objid BETWEEN BIGINT(FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333)*10000000000000))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( +0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( +0.5))
     * COS(RADIANS((O.ra) - (67.5)))
) >=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query120
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))

;
-- -----------------------------------------
-- Query121
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.zoneid BETWEEN FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)
            AND FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333))
AND
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))

;
-- -----------------------------------------
-- Query122
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.ra BETWEEN ((67.5)-( 1.0/60.0)) AND ((67.5)+( 1.0/60.0)))
AND
(O.dec BETWEEN (( +0.5)-( 1.0/60.0)) AND (( +0.5)+( 1.0/60.0)))
AND
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))

;
-- -----------------------------------------
-- Query123
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.objid BETWEEN BIGINT(FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333)*10000000000000))
AND
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))

;
-- -----------------------------------------
-- Query130
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query131
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.zoneid BETWEEN FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)
            AND FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333))
AND
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query132
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(D.objid BETWEEN BIGINT(FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333)*10000000000000))
AND
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query133
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.zoneid BETWEEN FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)
            AND FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333))
AND
(D.objid BETWEEN BIGINT(FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333)*10000000000000))
AND
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query134
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.ra BETWEEN ((67.5)-( 1.0/60.0)) AND ((67.5)+( 1.0/60.0)))
AND
(O.dec BETWEEN (( +0.5)-( 1.0/60.0)) AND (( +0.5)+( 1.0/60.0)))
AND
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query135
-- cone = 67.5, +0.5, 1.0/60.0
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.objid BETWEEN BIGINT(FLOOR((90.0 + ( +0.5) - ( 1.0/60.0))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( +0.5) + ( 1.0/60.0))/0.008333)*10000000000000))
AND
  ((O.cx * 0.3826688609525929)
 + (O.cy * 0.9238443540096138)
 + (O.cz * 0.008726535498373935))
>=  COS(RADIANS( 1.0/60.0))
 ;
-- -----------------------------------------
-- Query200
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))

;
-- -----------------------------------------
-- Query201
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.zoneid BETWEEN FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)
            AND FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))

;
-- -----------------------------------------
-- Query202
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.ra BETWEEN ((122.5)-( 0.5)) AND ((122.5)+( 0.5)))
AND
(O.dec BETWEEN (( -0.5)-( 0.5)) AND (( -0.5)+( 0.5)))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))

;
-- -----------------------------------------
-- Query203
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.objid BETWEEN BIGINT(FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333)*10000000000000))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))

;
-- -----------------------------------------
-- Query210
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query211
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.zoneid BETWEEN FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)
            AND FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query212
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(D.objid BETWEEN BIGINT(FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333)*10000000000000))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query213
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.zoneid BETWEEN FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)
            AND FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333))
AND
(D.objid BETWEEN BIGINT(FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333)*10000000000000))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query214
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.ra BETWEEN ((122.5)-( 0.5)) AND ((122.5)+( 0.5)))
AND
(O.dec BETWEEN (( -0.5)-( 0.5)) AND (( -0.5)+( 0.5)))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query215
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.objid BETWEEN BIGINT(FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333)*10000000000000))
AND
(   SIN(RADIANS(O.dec)) * SIN(RADIANS( -0.5))
  + COS(RADIANS(O.dec)) * COS(RADIANS( -0.5))
     * COS(RADIANS((O.ra) - (122.5)))
) >=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query220
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))

;
-- -----------------------------------------
-- Query221
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.zoneid BETWEEN FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)
            AND FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333))
AND
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))

;
-- -----------------------------------------
-- Query222
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.ra BETWEEN ((122.5)-( 0.5)) AND ((122.5)+( 0.5)))
AND
(O.dec BETWEEN (( -0.5)-( 0.5)) AND (( -0.5)+( 0.5)))
AND
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))

;
-- -----------------------------------------
-- Query223
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid
FROM Object O
WHERE
(O.objid BETWEEN BIGINT(FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333)*10000000000000))
AND
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))

;
-- -----------------------------------------
-- Query230
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query231
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.zoneid BETWEEN FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)
            AND FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333))
AND
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query232
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(D.objid BETWEEN BIGINT(FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333)*10000000000000))
AND
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query233
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.zoneid BETWEEN FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)
            AND FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333))
AND
(D.objid BETWEEN BIGINT(FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333)*10000000000000))
AND
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query234
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.ra BETWEEN ((122.5)-( 0.5)) AND ((122.5)+( 0.5)))
AND
(O.dec BETWEEN (( -0.5)-( 0.5)) AND (( -0.5)+( 0.5)))
AND
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))
 ;
-- -----------------------------------------
-- Query235
-- cone = 122.5, -0.5, 0.5
-- 
-- -----------------------------------------

SELECT O.objID, O.ra, O.dec, O.htmid, O.zoneid, D.detectid
FROM Object O, Detection D
WHERE O.objid=D.objid AND
(O.objid BETWEEN BIGINT(FLOOR((90.0 + ( -0.5) - ( 0.5))/0.008333)*10000000000000)
            AND BIGINT(FLOOR((90.0 + ( -0.5) + ( 0.5))/0.008333)*10000000000000))
AND
  ((O.cx * -0.5372791496241162)
 + (O.cy * 0.8433593320509249)
 + (O.cz * -0.008726535498373935))
>=  COS(RADIANS( 0.5))
 ;
