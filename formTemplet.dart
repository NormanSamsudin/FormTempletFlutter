import 'package:flutter/cupertino.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class formTempletPage extends StatefulWidget {
  @override
  State<formTempletPage> createState() => _formTempletPageState();
}

class _formTempletPageState extends State<formTempletPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    // variable of user input
    var _enteredVal1 = '';
    List<String?>? _selectedItemList1 = [];
    DateTime _selectedDate = DateTime.now();
    DateTimeRange _selectedDateRange;
    TimeOfDay _selectedTime;
    List<String?>? _selectedItemList2 = [];
    List<String?>? _selectedItemList3 = [];
    bool _selectedSwitch = false;
    var _enteredName = '';
    var _dropdownNation = '';
    var _selectedRadioButton = '';
    double _sliderVolume = 0.0;
    RangeValues _scaleSliderVolume;
    Map<String, bool>? _selectedAddOnn;
    DateTime _visualDate;
    bool _selectedCheckBox = false;

    // TODO: implement build
    return Column(
      children: [
        FastForm(
          formKey: formKey, // key untuk form
          inputDecorationTheme: const InputDecorationTheme(
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Color.fromARGB(184, 198, 131, 209)),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          children: [
            FastFormSection(
              padding: const EdgeInsets.fromLTRB(15, 7, 15, 10),
              header: const Padding(
                padding: EdgeInsets.fromLTRB(15, 1, 15, 1),
                child: Text(
                  'Form Example Section',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              children: [
                /////////////////////////////////////////////////////////////////////////////
                // untuk auto complete
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Name',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastAutocomplete<String>(
                  name: 'autocomplete',
                  //labelText: 'Autocomplete',
                  options: const [
                    'Alaska',
                    'Alabama',
                    'Connecticut',
                    'Delaware'
                  ],
                  onSaved: (newValue) {
                    _enteredVal1 = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                //////////////////////////////////////////////////////////////////////////
                /// untuk pick date
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Appointment Date',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastDatePicker(
                  name: 'date_picker',
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2040),
                  onSaved: (newValue) {
                    _selectedDate = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),

                /////////////////////////////////////////////////////////////////////////
                ///   pick date for certain range
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Booking hotel',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastDateRangePicker(
                  name: 'date_range_picker',
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2040),
                  onSaved: (newValue) {
                    _selectedDateRange = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                //////////////////////////////////////////////////////////////////////////
                /// time booking
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Register Time',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastTimePicker(
                  name: 'time_picker',
                  onSaved: (newValue) {
                    _selectedTime = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                //////////////////////////////////////////////////////////////////////////
                /// tag selection
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Select Tag',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastChipsInput(
                  name: 'input_chips',
                  options: ['Angular', 'React', 'Vue', 'Svelte', 'Flutter'],
                  initialValue: const [
                    'HTML',
                    'CSS',
                    'React',
                    'Dart',
                    'TypeScript',
                    'Angular',
                  ],
                  onSaved: (newValue) {
                    _selectedItemList2 = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                //////////////////////////////////////////////////////////////////////////
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Potato Chips',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastChoiceChips(
                  name: 'choice_chips',
                  alignment: WrapAlignment.center,
                  chipPadding: const EdgeInsets.all(8.0),
                  chips: [
                    FastChoiceChip(
                      avatar: const FlutterLogo(),
                      selected: true,
                      value: 'Flutter',
                    ),
                    FastChoiceChip(
                      avatar: const Icon(Icons.android_sharp, size: 16.0),
                      value: 'Android',
                    ),
                    FastChoiceChip(
                      selected: true,
                      value: 'Chrome OS',
                    ),
                  ],
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please select at least one chip'
                      : null,
                  onSaved: (newValue) {
                    _selectedItemList3 = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                ////////////////////////////////////////////////////////////////////////////
                /// switch

                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Switch Button',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastSwitch(
                  name: 'switch',
                  titleText: 'This is a switch',
                  contentPadding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  onSaved: (newValue) {
                    _selectedSwitch = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                //////////////////////////////////////////////////////////////////////////
                /// normal text field
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Name2',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastTextField(
                  name: 'text_field',
                  keyboardType: TextInputType.name,
                  prefix: const Icon(Icons.calendar_today),
                  buildCounter: inputCounterWidgetBuilder,
                  inputFormatters: const [],
                  validator: Validators.compose([
                    Validators.required((value) => 'Field is required'),
                    Validators.minLength(
                        7,
                        (value, minLength) =>
                            'Field must contain at least $minLength characters')
                  ]),
                  onSaved: (newValue) {
                    _enteredName = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                ////////////////////////////////////////////////////////////////////////
                /// dorp down button
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Nation',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastDropdown<String>(
                  name: 'dropdown',
                  items: ['Norway', 'Sweden', 'Finland', 'Denmark', 'Iceland'],
                  initialValue: 'Finland',
                  onSaved: (newValue) {
                    _dropdownNation = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                /////////////////////////////////////////////////////////////////////////
                /// radio button
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Radiobutton',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastRadioGroup<String>(
                  name: 'radio_group',
                  options: const [
                    FastRadioOption(title: Text('Option 1'), value: 'option-1'),
                    FastRadioOption(title: Text('Option 2'), value: 'option-2'),
                    FastRadioOption(title: Text('Option 3'), value: 'option-3'),
                  ],
                  onSaved: (newValue) {
                    _selectedRadioButton = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                //////////////////////////////////////////////////////////////////////////
                /// slider

                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Volume',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastSlider(
                  name: 'slider',
                  helperText: 'A Slider with prefix and suffix widgets',
                  min: 0,
                  max: 10,
                  prefixBuilder: (field) {
                    final enabled = field.widget.enabled;
                    return IconButton(
                      icon: const Icon(Icons.volume_off),
                      onPressed: enabled
                          ? () => field.didChange(field.widget.min)
                          : null,
                    );
                  },
                  suffixBuilder: (field) {
                    final enabled = field.widget.enabled;
                    return IconButton(
                      icon: const Icon(Icons.volume_up),
                      onPressed: enabled
                          ? () => field.didChange(field.widget.max)
                          : null,
                    );
                  },
                  validator: (value) =>
                      value! > 8 ? 'Volume is too high' : null,
                  onSaved: (newValue) {
                    _sliderVolume = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                //////////////////////////////////////////////////////////////////////////////

                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Volume',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastRangeSlider(
                  name: 'range_slider',
                  min: 0,
                  max: 10,
                  divisions: 10,
                  labelsBuilder: rangeSliderLabelsBuilder,
                  prefixBuilder: rangeSliderPrefixBuilder,
                  suffixBuilder: rangeSliderSuffixBuilder,
                  onSaved: (newValue) {
                    _scaleSliderVolume = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                /////////////////////////////////////////////////////////////////////////////
                /// select calendar
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Calendar',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastCalendar(
                  name: 'calendar',
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2040),
                  onSaved: (newValue) {
                    _visualDate = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                /////////////////////////////////////////////////////////////////////////////
                /// checkbox
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Checkbox',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ))),
                  ],
                ),

                FastCheckbox(
                  name: 'checkbox',
                  titleText: 'I accept',
                  contentPadding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                  onSaved: (newValue) {
                    _selectedCheckBox = newValue!;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
          // onChanged: (value) {
          //   // ignore: avoid_print
          //   print('Form changed: ${value.toString()}');
          // },
        ),
        // ElevatedButton(
        //   child: const Text('Reset'),
        //   onPressed: () => formKey.currentState?.reset(),
        // ),
        SizedBox(
          width: 370,
          height: 50,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState?.save();
                  print('Name ${_enteredName}');
                  print('Appointment Date $_selectedDate');
                  // boleh lagy nk try variable lain
                }
                //print('error');
              },
              child: Text('save')),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
