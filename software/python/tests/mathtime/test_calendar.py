import pytest

from src.valladopy.mathtime.calendar import initialize_time, get_int_month


class TestInitializeTime:
    def test_non_leap_year(self):
        """Test initialize_time for a non-leap year."""
        time_data = initialize_time(2023)  # 2023 is a non-leap year
        assert time_data["lmonth"] == [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        assert time_data["monthtitle"] == [
            "jan",
            "feb",
            "mar",
            "apr",
            "may",
            "jun",
            "jul",
            "aug",
            "sep",
            "oct",
            "nov",
            "dec",
        ]
        assert time_data["daytitle"] == [
            "sun",
            "mon",
            "tue",
            "wed",
            "thu",
            "fri",
            "sat",
        ]

    def test_leap_year(self):
        """Test initialize_time for a leap year."""
        time_data = initialize_time(2024)  # 2024 is a leap year
        assert time_data["lmonth"] == [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


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
