import logger

# Globals
logger = logger.instance


def main():
    logger.info('Script started.')
    print('Hello python 3')


def sum(x, y):
    """
    Returns the sum of 2 numbers

    >>> sum(1, 2)
    3
    """

    return x + y


if __name__ == '__main__':
    main()
