import numpy as np


def safe_sqrt(value: float, context: str = '') -> float:
    """Safe square root function that checks for negative values.

    Args:
        value (float): The value to take the square root of
        context (str, optional): A description of the current step or variable
                                 being used

    Returns:
        float: The square root of the value

    Raises:
        ValueError: If the value is negative
    """
    if value < 0:
        error_message = f'Cannot take square root of negative value: ({value})'
        if context:
            error_message += f'\nContext: {context}'
        raise ValueError(error_message)
    return np.sqrt(value)
