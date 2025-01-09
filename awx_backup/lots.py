import ijson


def extract_lot_numbers(json_filename):
    with open(json_filename, 'rb') as input_file:
        lot_numbers = ijson.items(input_file, 'features.item.properties.LOT_NUM')
        for number in lot_numbers:
            print('Lot number: {}'.format(number))


if __name__ == '__main__':
    extract_lot_numbers('citylots.json')
