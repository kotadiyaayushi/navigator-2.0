import 'package:expense_tracker_app/framework/controller/expense_controller.dart';
import 'package:expense_tracker_app/framework/expense_category.dart';
import 'package:expense_tracker_app/framework/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  VoidCallback onClose;
  Expense? expense;
  AddTransactionScreen({required this.onClose, this.expense});

  @override
  ConsumerState<AddTransactionScreen> createState() {
    // TODO: implement createState
    return _AddTransactionScreen();
  }
}

class _AddTransactionScreen extends ConsumerState<AddTransactionScreen>
    with TickerProviderStateMixin {
  double dragOffset = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController incomeTitleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController incomeAmountController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  late TabController tabController;
  ExpenseCategory selectedCategory = ExpenseCategory.other;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dragOffset = 0;
    tabController = TabController(length: 2, vsync: this);

    final expense = widget.expense;

    if (expense != null) {
      titleController.text = expense.title;
      amountController.text = expense.amount.toString();
      selectedCategory = expense.category;
      noteController.text = expense.note ?? '';
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    titleController.dispose();
    incomeTitleController.dispose();
    amountController.dispose();
    incomeAmountController.dispose();
    noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Color(0xFF232323),
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 0) {
            setState(() {
              dragOffset = dragOffset + details.delta.dy;
            });
          }
        },
        onVerticalDragEnd: (details) {
          if (dragOffset > 150 || (details.primaryVelocity ?? 0) > 700) {
            widget.onClose();
          } else {
            setState(() {
              dragOffset = 0;
            });
          }
        },
        child: Transform.translate(
          offset: Offset(0, dragOffset),
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              // color: Colors.red,
              color: Color(0xFF232323),
              // border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                TabBar(
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Tab(text: 'Expense'),
                    Tab(text: 'Income'),
                  ],
                ),
      
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      // Expense page
                      ListView(
                        padding: const EdgeInsets.fromLTRB(8, 18, 8, 18),
      
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              labelText: 'Expense title',
                              hintText: 'e.g. Lunch, Shopping',
                              prefixIcon: const Icon(Icons.edit_note_rounded),
                              filled: true,
                              fillColor: const Color(0xFF303030),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
      
                          TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Amount',
                              hintText: 'Enter amount',
                              prefixIcon: Icon(Icons.currency_rupee_rounded),
                              filled: true,
                              fillColor: const Color(0xFF303030),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
      
                          SizedBox(height: 12),
      
      
                          DropdownButtonFormField<ExpenseCategory>(
                            initialValue: selectedCategory,
                            decoration: InputDecoration(
                              labelText: 'Category',
                              prefixIcon: const Icon(Icons.category_rounded),
                              filled: true,
                              fillColor: Color(0xFF303030),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.white70,
                                  width: 1.2,
                                ),
                              ),
                            ),
                            dropdownColor: Color(0xFF303030),
                            icon: Icon(Icons.keyboard_arrow_down_rounded),
                            items: ExpenseCategory.values.map((category) {
                              return DropdownMenuItem<ExpenseCategory>(
                                value: category,
                                child: Text(
                                  '${category.name[0].toUpperCase()}${category.name.substring(1)}',
                                ),
                              );
                            }).toList(),
                            onChanged: (category) {
                              if (category != null) {
                                setState(() {
                                  selectedCategory = category;
                                });
                              }
                            },
                          ),
      
      
      
                          const SizedBox(height: 12),
      
                          TextField(
                            controller: noteController,
                            maxLines: 2,
                            decoration: InputDecoration(
                              labelText: 'Note (optional)',
                              hintText: 'Add a note about this expense',
                              prefixIcon: const Icon(Icons.notes_rounded),
                              filled: true,
                              fillColor: const Color(0xFF303030),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
      
      
                        ],
                      ),
      
                      // Income page
                      Column(
                        children: [
                          TextField(
                            controller: incomeTitleController,
                            decoration: InputDecoration(
                              labelText: 'Income title',
                              hintText: 'Enter income title',
                            ),
                          ),
      
                          TextField(
                            controller: incomeAmountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Income amount',
                              hintText: 'Enter income amount',
                            ),
                          ),
      
                        ],
                      ),
                    ],
                  ),
                ),
      
      
                Padding(
                  padding: EdgeInsets.only(bottom: 18.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFD740),
                        foregroundColor: Color(0xFF171717),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        if (tabController.index == 0) {
                          if (titleController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter expense title'),
                              ),
                            );
                            return;
                          }
      
                          final amount = double.tryParse(amountController.text.trim());
      
                          if (amount == null || amount <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter valid expense amount'),
                              ),
                            );
                            return;
                          }
      
      
                          final existingExpense = widget.expense;
      
                          final expense = Expense(
                            id: existingExpense?.id ??
                                DateTime.now().microsecondsSinceEpoch.toString(),
                            title: titleController.text.trim(),
                            amount: amount,
                            category: selectedCategory,
                            note: noteController.text.trim().isEmpty
                                ? null
                                : noteController.text.trim(),
                            date: existingExpense?.date ?? DateTime.now(),
                          );
      
                          if (existingExpense == null) {
                            ref.read(expenseController.notifier).addExpense(expense);
                          } else {
                            ref.read(expenseController.notifier).updateExpense(expense);
                          }
                          widget.onClose();
      
      
                          titleController.clear();
                          amountController.clear();
                          noteController.clear();
                          setState(() {
                            selectedCategory = ExpenseCategory.other;
                          });
      
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Expense added'),
                            ),
                          );
                        } else {
                          if (incomeTitleController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please enter an income title'),
                              ),
                            );
                            return;
                          }
      
                          final amount = double.tryParse(incomeAmountController.text.trim());
      
                          if (amount == null || amount <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please enter a valid income amount'),
                              ),
                            );
                            return;
                          }
      
                          debugPrint('Income tab selected: $amount');
      
                          incomeTitleController.clear();
                          incomeAmountController.clear();
      
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Income form validated'),
                            ),
                          );
                        }
                      },
      
                      child: Text('Save'),
                    ),
                  ),
                ),
      
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
