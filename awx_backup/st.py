import ijson


def extract_properties(json_filename):
    with open(json_filename, 'rb') as input_file:
        objects = ijson.items(input_file, 'features.item.properties')
        street_properties = (o for o in objects if o['ST_TYPE'] == 'ST')
        for prop in street_properties:
            print('Property on a street (ST): {}'.format(prop))


if __name__ == '__main__':
    extract_properties('citylots.json')
