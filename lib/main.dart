import 'package:flutter/material.dart';

void main() => runApp(const DemoApp());

class Employee { Employee(this.name, this.role, this.department); String name, role, department; }

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner: false, title: 'Firestore Records Demo', theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffed8a35)), useMaterial3: true), home: const RecordsPage());
}

class RecordsPage extends StatefulWidget { const RecordsPage({super.key}); @override State<RecordsPage> createState() => _RecordsPageState(); }
class _RecordsPageState extends State<RecordsPage> {
  final _name = TextEditingController(), _role = TextEditingController(), _department = TextEditingController();
  final List<Employee> _employees = [Employee('Jordan Lee', 'Designer', 'Product'), Employee('Taylor Morgan', 'Developer', 'Engineering')];
  void _add() { if (_name.text.trim().isEmpty || _role.text.trim().isEmpty || _department.text.trim().isEmpty) return; setState(() { _employees.add(Employee(_name.text.trim(), _role.text.trim(), _department.text.trim())); _name.clear(); _role.clear(); _department.clear(); }); }
  @override
  void dispose() { _name.dispose(); _role.dispose(); _department.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Employee Records')), body: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 700), child: ListView(padding: const EdgeInsets.all(20), children: [const Card(child: ListTile(leading: Icon(Icons.cloud_off), title: Text('Demo mode — no Firebase connection'), subtitle: Text('Records reset when this app closes.'))), const SizedBox(height: 12), TextField(controller: _name, decoration: const InputDecoration(labelText: 'Employee name', border: OutlineInputBorder())), const SizedBox(height: 10), TextField(controller: _role, decoration: const InputDecoration(labelText: 'Job title', border: OutlineInputBorder())), const SizedBox(height: 10), TextField(controller: _department, decoration: const InputDecoration(labelText: 'Department', border: OutlineInputBorder())), const SizedBox(height: 10), FilledButton.icon(onPressed: _add, icon: const Icon(Icons.add), label: const Text('Add employee')), const SizedBox(height: 18), Text('Employees (${_employees.length})', style: Theme.of(context).textTheme.titleLarge), ..._employees.map((e) => Card(child: ListTile(leading: const CircleAvatar(child: Icon(Icons.person)), title: Text(e.name), subtitle: Text('${e.role} • ${e.department}'))))]))));
}
