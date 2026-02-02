SELECT
    ip,
    COUNT(*) AS invalid_count
FROM logs
WHERE
    LENGTH(ip) - LENGTH(REPLACE(ip, '.', '')) != 3   -- Less or more than 4 octets (dot count != 3)
    OR
    ip REGEXP '(^|\\.)(25[6-9]|2[6-9][0-9]|[3-9][0-9]{2})(\\.|$)'   -- Any octet greater than 255
    OR
    ip REGEXP '(^|\\.)(0[0-9]+)(\\.|$)'       -- Leading zeros in any octet (01, 001, etc.)
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
