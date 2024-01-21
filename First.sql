SELECT 
     SUBSTRING_INDEX(string, 'YY', 1) AS Name,
    CASE 
        WHEN string LIKE 'Rohal KhanYY-2022@%' THEN 
        CONCAT(
            SUBSTRING_INDEX(SUBSTRING_INDEX(string, '@', -1), 'gmail', 1), 
            '@', 
            SUBSTRING_INDEX(SUBSTRING_INDEX(string, 'Khan', -1), 'MM-', 1), 
            SUBSTRING_INDEX(SUBSTRING_INDEX(string, 'MM-02', -1), 'DD', 1)
        )
        ELSE CONCAT(
            SUBSTRING_INDEX(SUBSTRING_INDEX(string, 'YY-2022', -1), 'MM-', 1),
            '.',
            SUBSTRING_INDEX(SUBSTRING_INDEX(string, '.', -1), 'DD', 1)
        )
    END AS Email,
    CONCAT(
        SUBSTRING(string, LOCATE('MM', string) + 3, 2),
        '-',
        SUBSTRING(string, LOCATE('DD', string) + 3, 2),
        '-',
        SUBSTRING(string, LOCATE('YY', string) + 3, 4)
    ) AS Date
FROM work;