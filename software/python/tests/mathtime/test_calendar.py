import pytest

import src.valladopy.mathtime.calendar as cal


class TestInitializeTime:
    def test_non_leap_year(self):
        """Test initialize_time for a non-leap year."""
        time_data = cal.initialize_time(2023)  # 2023 is a non-leap year
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
        time_data = cal.initialize_time(2024)  # 2024 is a leap year
        assert time_data["lmonth"] == [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


class TestGetIntMonth:
    invalid_month_str = "Invalid month abbreviation:"

    def test_valid_months(self):
        """Test valid month abbreviations."""
        assert cal.get_int_month("jan") == 1
        assert cal.get_int_month("feb") == 2
        assert cal.get_int_month("mar") == 3
        assert cal.get_int_month("apr") == 4
        assert cal.get_int_month("may") == 5
        assert cal.get_int_month("jun") == 6
        assert cal.get_int_month("jul") == 7
        assert cal.get_int_month("aug") == 8
        assert cal.get_int_month("sep") == 9
        assert cal.get_int_month("oct") == 10
        assert cal.get_int_month("nov") == 11
        assert cal.get_int_month("dec") == 12

    def test_case_insensitivity(self):
        """Test that the function is case-insensitive."""
        assert cal.get_int_month("JAN") == 1
        assert cal.get_int_month("Feb") == 2
        assert cal.get_int_month("DeC") == 12

    def test_invalid_month(self):
        """Test invalid month abbreviations."""
        with pytest.raises(ValueError, match=self.invalid_month_str):
            cal.get_int_month("xyz")
        with pytest.raises(ValueError, match=self.invalid_month_str):
            cal.get_int_month("")


class TestGetIntDay:
    invalid_day_str = "Invalid day abbreviation:"

    def test_valid_days(self):
        """Test valid day abbreviations."""
        assert cal.get_int_day("sun") == 1
        assert cal.get_int_day("mon") == 2
        assert cal.get_int_day("tue") == 3
        assert cal.get_int_day("wed") == 4
        assert cal.get_int_day("thu") == 5
        assert cal.get_int_day("fri") == 6
        assert cal.get_int_day("sat") == 7

    def test_case_insensitivity(self):
        """Test case-insensitivity for day abbreviations."""
        assert cal.get_int_day("SUN") == 1
        assert cal.get_int_day("Mon") == 2
        assert cal.get_int_day("fRI") == 6

    def test_invalid_day(self):
        """Test invalid day abbreviations."""
        with pytest.raises(ValueError, match=self.invalid_day_str):
            cal.get_int_day("xyz")
        with pytest.raises(ValueError, match=self.invalid_day_str):
            cal.get_int_day("")
