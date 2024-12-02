import pytest

from src.valladopy.mathtime.calendar import get_int_month


class TestGetIntMonth:
    invalid_month_str = "Invalid month abbreviation:"
    no_attr_str = "object has no attribute 'lower'"

    def test_valid_months(self):
        """Test valid month abbreviations."""
        assert get_int_month("jan") == 1
        assert get_int_month("feb") == 2
        assert get_int_month("mar") == 3
        assert get_int_month("apr") == 4
        assert get_int_month("may") == 5
        assert get_int_month("jun") == 6
        assert get_int_month("jul") == 7
        assert get_int_month("aug") == 8
        assert get_int_month("sep") == 9
        assert get_int_month("oct") == 10
        assert get_int_month("nov") == 11
        assert get_int_month("dec") == 12

    def test_case_insensitivity(self):
        """Test that the function is case-insensitive."""
        assert get_int_month("JAN") == 1
        assert get_int_month("Feb") == 2
        assert get_int_month("DeC") == 12

    def test_invalid_month(self):
        """Test invalid month abbreviations."""
        with pytest.raises(ValueError, match=self.invalid_month_str):
            get_int_month("xyz")
        with pytest.raises(ValueError, match=self.invalid_month_str):
            get_int_month("")
        with pytest.raises(ValueError, match=self.invalid_month_str):
            get_int_month("January")  # full month name

    def test_edge_cases(self):
        """Test edge cases for input types."""
        with pytest.raises(AttributeError, match=f"'NoneType' {self.no_attr_str}"):
            get_int_month(None)
        with pytest.raises(AttributeError, match=f"'int' {self.no_attr_str}"):
            get_int_month(123)
