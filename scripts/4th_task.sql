-- -=== TRIGGERS ===-
-- trigger that check email for new user
-- procedure to check email is regex and is unique
create or replace function check_email(_id integer) returns bool
 language plpgsql
as $$
declare
  email text;
begin
    select email into email from "User" where id = _id;
    if not email ~* '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$' then
        raise exception 'Email is bad';
    end if;
    if exists(select email from "User" where email = email and id != _id) then
        raise exception 'Email is not unique';
    end if;
    return true;
    end;
$$;

-- trigger that check email for new user
create or replace trigger check_email
after insert on "User"
for each row
execute function check_email(new.id);

-------------------------------------------------------------------------

-- trigger that check email for update user
create or replace function check_email_update(_id integer) returns bool
 language plpgsql
as $$
declare
  email text;
begin
    select email into email from "User" where id = _id;
    if not email ~* '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$' then
        raise exception 'Email is bad';
    end if;
    if exists(select email from "User" where email = email and id != _id) then
        raise exception 'Email is not unique';
    end if;
    return true;
    end;
$$;

------------------------
--vytvoření alespoň dvou netriviálních uložených procedur vč. jejich předvedení, ve kterých se musí (dohromady)
-- vyskytovat alespoň jednou kurzor, ošetření výjimek a použití proměnné s datovým typem odkazujícím se na řádek
-- či typ sloupce tabulky

-- -=== PROCEDURES ===-
-- procedure that check email for new user
