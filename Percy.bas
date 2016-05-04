DECLARE SUB Grundwert()
DECLARE SUB Prozentwert()
DECLARE SUB Prozentsatz()
DIM choice AS STRING

COLOR 14,1

DO
    CLS
    ?
    PRINT " Hallo ich bin Percy, was darf ich dir berechnen?"
    ?
    PRINT "     a)   Grundwert berechnen"
    PRINT "     b)   Prozentwert berechnen"
    PRINT "     c)   Prozentsatz berechnen"
    PRINT "     d)   Programm beenden"
    ?
    INPUT "     Treffen Sie ihre Wahl: ", choice
    
    SELECT CASE choice
    CASE "a"
        Grundwert()
    CASE "b"
        Prozentwert()
    CASE "c"
        Prozentsatz()
    CASE "d"
        ?
        ?
        PRINT "Das Programm ist nun beendet"
        SLEEP 2000
        CLS
        ?
        PRINT "        END OF LINE"
        SLEEP 2000
        END
    CASE ELSE
        ?
        PRINT "     Ungueltige eingabe >>"; choice;"<<"
        SLEEP 4000
    END SELECT
LOOP
' Weiter zu den Subroutinen

SUB Grundwert()
    DIM AS DOUBLE pw, ps, gw
    CLS    
    PRINT "     Grundwert berechnen"
    ?
    PRINT "     Bitte werte zur Berechnung eingeben"
    ?
    INPUT "     Prozentwert: ", pw
    INPUT "     Prozentsatz: ", ps
    gw = pw * 100 / ps
    SLEEP 1000
    
    ?
    PRINT "  "; pw; " x 100"
    PRINT "-------------- = "; gw
    PRINT "    "; ps; "%"
    ?
    PRINT "Druecke eine beliebige Taste..."
    GETKEY
    ?
END SUB

SUB Prozentwert()
    DIM AS DOUBLE pw, ps, gw
    CLS
    PRINT "     Prozentwert berechnen"
    ?
    PRINT "     Bitte werte zur Berechnung eingeben"
    ?
    INPUT "     Grundwert: ", gw
    INPUT "     Prozentsatz: ", ps
    pw = gw * ps / 100
    SLEEP 1000
    
    ?
    PRINT "  "; gw; " x "; ps; "%"
    PRINT "-------------- = "; pw
    PRINT "    100"
    ?
    PRINT "Druecke eine beliebige Taste..."
    GETKEY
    ?
END SUB

SUB Prozentsatz()
    DIM AS DOUBLE pw, ps, gw
    CLS
    PRINT "     Prozentsatz berechnen"
    ?
    PRINT "     Bitte werte zur Berechnung eingeben"
    ?
    INPUT "     Grundwert: ", gw
    INPUT "     Prozentwert: ", pw
    ps = pw * 100 / gw
    SLEEP 1000
    
    ?
    PRINT "  "; pw; " x 100"
    PRINT "-------------- = "; ps; "%"
    PRINT "    "; gw
    ?
    PRINT "Druecke eine beliebige Taste..."
    GETKEY
    ?
END SUB
