def Settings(**kwargs):
    if kwargs['language'] == 'cfamily':
        filename = kwargs['filename']

        flags = []
        if filename.endswith(('.c', '.h')):
            flags.extend(['-x', 'c'])
        elif filename.endswith(('.cc', '.cpp', '.hpp')):
            flags.extend(['-x', 'c'])

        flags.extend(['-Wall', '-Wextra', '-Werror'])

        return {
            'flags': flags
        }
    else:
        return {}
