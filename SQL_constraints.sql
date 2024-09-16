-- Constraint: Ensure stock level doesn't fall below zero
ALTER TABLE Inventory
ADD CONSTRAINT chk_stock_level CHECK (stock_level >= 0);

-- Transaction: Adjust inventory after order is placed
CREATE OR REPLACE FUNCTION update_inventory() RETURNS TRIGGER AS $$
BEGIN
    UPDATE Inventory
    SET stock_level = stock_level - NEW.quantity
    WHERE branch_id = NEW.branch_id AND menu_item_id = NEW.menu_item_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Stock not available for this menu item.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_inventory
AFTER INSERT ON OrderDetails
FOR EACH ROW EXECUTE FUNCTION update_inventory();
