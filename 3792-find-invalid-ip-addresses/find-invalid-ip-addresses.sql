SELECT
    ip,
    COUNT(*) AS invalid_count
FROM logs
WHERE
    -- ❌ Less or more than 4 octets (dot count != 3)
    LENGTH(ip) - LENGTH(REPLACE(ip, '.', '')) != 3

    OR

    -- ❌ Any octet greater than 255
    ip REGEXP '(^|\\.)(25[6-9]|2[6-9][0-9]|[3-9][0-9]{2})(\\.|$)'

    OR

    -- ❌ Leading zeros in any octet (01, 001, etc.)
    ip REGEXP '(^|\\.)0[0-9]+'
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
