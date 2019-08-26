from robot import Robot


def test_walk():
    robot = Robot()
    assert robot.walk() == 'walk'
