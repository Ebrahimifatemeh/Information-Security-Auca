# Lab 12 – Task: Hybrid Brute-Force Attack Using Personal Information

## Attack Type
Hybrid brute-force attack (targeted attack).

## Description
In a hybrid brute-force attack, the attacker does not rely only on random
passwords. Instead, they collect publicly available information about the
victim and combine it with common password patterns.

Typical victim-related data:
- First name
- Last name
- Date of birth
- Nickname
- Year of birth
- Simple number patterns

This information is often obtained from social media, public profiles,
data leaks, or previous breaches.

---

## Example Victim Information
- Name: John
- Surname: Doe
- Date of Birth: 1998

---

## Generated Password Variations
Using the victim information, attackers can generate passwords such as:

- john1998
- doe1998
- john_doe
- John@1998
- johnDoe98
- doe@123
- john1998!

These variations are combined with dictionary words to increase the chance
of a successful login.

---

## Example Usage with Hydra (Conceptual)

```bash
hydra -L usernames.txt -P generated_passwords.txt localhost http-form-post \
"/login:username=^USER^&password=^PASS^:F=Invalid"


Security Risk

Hybrid brute-force attacks are more effective than simple brute-force attacks
because:

They reduce the number of attempts needed

Passwords are more likely to match real user behavior

Prevention Methods

Use strong, unique passwords

Avoid using personal information in passwords

Enable account lockout after multiple failed attempts

Use rate limiting and CAPTCHA

Enable multi-factor authentication (MFA)

Conclusion

Hybrid brute-force attacks demonstrate how personal information can be
combined with automated tools to compromise weak authentication systems.
This highlights the importance of strong password policies and additional
security mechanisms.

----------



