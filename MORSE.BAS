DECLARE FUNCTION MORSEC$ (CHAR$)

DIM MESSAGE AS STRING

OPEN "INPUT.STR" FOR INPUT AS 1
  LINE INPUT #1, MESSAGE$

LET RESULT$ = ""

FOR I = 1 TO LEN(MESSAGE$)
  LET C$ = UCASE$(MID$(MESSAGE$, I, 1))

  IF I <> 1 THEN RESULT$ = RESULT$ + " "
  RESULT$ = RESULT$ + MORSEC$(C$)
  NEXT I

PRINT RESULT$

SYSTEM

FUNCTION MORSEC$ (CHAR$)
 SELECT CASE CHAR$
    CASE "A"
      MORSEC$ = ".-"
    CASE "B"
      MORSEC$ = "-..."
    CASE "C"
      MORSEC$ = "-.-."
    CASE "D"
      MORSEC$ = "-.."
    CASE "E"
      MORSEC$ = "."
    CASE "F"
      MORSEC$ = "..-."
    CASE "G"
      MORSEC$ = "--."
    CASE "H"
      MORSEC$ = "...."
    CASE "I"
      MORSEC$ = ".."
    CASE "J"
      MORSEC$ = ".---"
    CASE "K"
      MORSEC$ = "-.-"
    CASE "L"
      MORSEC$ = ".-.."
    CASE "M"
      MORSEC$ = "--"
    CASE "N"
      MORSEC$ = "-."
    CASE "O"
      MORSEC$ = "---"
    CASE "P"
      MORSEC$ = ".--."
    CASE "Q"
      MORSEC$ = "--.-"
    CASE "R"
      MORSEC$ = ".-."
    CASE "S"
      MORSEC$ = "..."
    CASE "T"
      MORSEC$ = "-"
    CASE "U"
      MORSEC$ = "..-"
    CASE "V"
      MORSEC$ = "...-"
    CASE "W"
      MORSEC$ = ".--"
    CASE "X"
      MORSEC$ = "-..-"
    CASE "Y"
      MORSEC$ = "-.--"
    CASE "Z"
      MORSEC$ = "--.."
    CASE " "
      MORSEC$ = "/"
    CASE ELSE
      MORSEC$ = ""
  END SELECT
END FUNCTION

